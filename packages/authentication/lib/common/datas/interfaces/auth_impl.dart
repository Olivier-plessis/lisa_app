import 'package:app_authentication/common/domain/states/states.dart';
import 'package:dartz/dartz.dart';

abstract class IAuthRepository {
  Future<Either<Failure, SuccessAuth>> signIn();
  Future<Either<Failure, Unit>> signOut();
  Future<bool> isRegistrationComplete();
}
