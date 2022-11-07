import 'package:app_authentication/common/datas/interfaces/interfaces.dart';
import 'package:app_authentication/common/domain/models/models.dart';
import 'package:app_authentication/common/domain/states/data_source_exception.dart';
import 'package:app_authentication/common/domain/states/states.dart';
import 'package:dartz/dartz.dart';

class AuthRepository implements IAuthRepository {
  AuthRepository(this._authRemoteDataSource, this._authLocalDataSource);

  final IRemoteDataSources _authRemoteDataSource;
  final IAuthLocalDataSource _authLocalDataSource;

  @override
  Future<Either<Failure, SuccessAuth>> signIn() async {
    try {
      final UserCredentials userCredentials =
          await _authRemoteDataSource.googleSignIn();
      await _authLocalDataSource.storeUserCredentials(userCredentials);

      final bool isRegistrationComplete =
          await _authRemoteDataSource.isRegistrationComplete();

      final User user = User(
        id: userCredentials.uid,
        email: userCredentials.email,
        name: userCredentials.name,
        photo: userCredentials.photo,
        createdAt: DateTime.now(),
      );

      return Right<Failure, SuccessAuth>(SuccessAuth(
          registrationComplete: isRegistrationComplete, user: user));
    } on ExceptionAuth catch (e) {
      return Left<Failure, SuccessAuth>(
          Failure.authenticationFailure(e.failureReason));
    } on AuthLocalDataSourceException {
      return const Left<Failure, SuccessAuth>(
          Failure.authenticationLocalDataSourceFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> signOut() async {
    try {
      await _authRemoteDataSource.signOut();
      return const Right<Failure, Unit>(unit);
    } catch (e) {
      return const Left<Failure, Unit>(Failure.signOutError());
    }
  }

  @override
  Future<bool> isRegistrationComplete() async {
    return _authRemoteDataSource.isRegistrationComplete();
  }
}
