import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:app_authentication/common/datas/interfaces/interfaces.dart';
import 'package:app_authentication/common/datas/repositories/repositories.dart';
import 'package:app_authentication/common/domain/models/models.dart';
import 'package:app_authentication/common/domain/states/data_source_exception.dart';
import 'package:app_authentication/common/domain/states/states.dart';

import 'auth_repository_test.mocks.dart';

// Mock dependencies
@GenerateMocks(<Type>[IRemoteDataSources, IAuthLocalDataSource])
void main() {
  late IRemoteDataSources mockAuthRemoteDataSource;
  late IAuthLocalDataSource mockAuthLocalDataSource;
  late AuthRepository authRepository;

  setUp(() {
    mockAuthRemoteDataSource = MockIRemoteDataSources();
    mockAuthLocalDataSource = MockIAuthLocalDataSource();
    authRepository =
        AuthRepository(mockAuthRemoteDataSource, mockAuthLocalDataSource);
  });

  const UserCredentials userCredentials = UserCredentials(
    email: 'john@doe.com',
    uid: '2511myUid12',
    name: 'john doe',
    photo: 'https://picsum.photos/200/300',
  );
  final User user = User(id: userCredentials.uid, email: userCredentials.email);
  final SuccessAuth authSuccess =
      SuccessAuth(registrationComplete: true, user: user);
  const Failure authFailureOther =
      Failure.authenticationFailure(AuthFailureReason.other);
  const Failure authFailureGoogleSignIn =
      Failure.authenticationFailure(AuthFailureReason.googleSignIn);

  group('Sign in tests', () {
    void setupSuccess() {
      when(mockAuthRemoteDataSource.googleSignIn())
          .thenAnswer((_) async => userCredentials);
      when(mockAuthLocalDataSource.storeUserCredentials(userCredentials))
          .thenAnswer((_) async {});
      when(mockAuthRemoteDataSource.isRegistrationComplete())
          .thenAnswer((_) async => Future<bool>.value(true));
    }

    test(
      'authRepository.signIn should call authRemoteDataSource.googleSignIn',
      () async* {
        // Arrange
        setupSuccess();
        // Act
        await authRepository.signIn();
        // Assert
        verify(mockAuthRemoteDataSource.googleSignIn());
      },
    );

    test(
      'authRepository.signIn should call authRemoteDataSource.isRegistrationComplete',
      () async* {
        setupSuccess();
        await authRepository.signIn();
        verify(mockAuthRemoteDataSource.isRegistrationComplete());
      },
    );

    test(
      'authRepository.signIn should call authLocalDataSource.storeUserCredentials with userCredentials',
      () async* {
        setupSuccess();
        await authRepository.signIn();
        verify(mockAuthLocalDataSource.storeUserCredentials(userCredentials));
      },
    );

    test(
      'authRepository.signIn should return authSuccess when user signed in successfully',
      () async* {
        setupSuccess();
        final Either<Failure, SuccessAuth> result =
            await authRepository.signIn();
        expect(result, Right<Failure, SuccessAuth>(authSuccess));
      },
    );

    test(
      'authRepository.signIn should return AuthenticationFailure.other when sign in failed',
      () async* {
        when(mockAuthRemoteDataSource.googleSignIn()).thenAnswer((_) async =>
            throw const ExceptionAuth(failureReason: AuthFailureReason.other));
        final Either<Failure, SuccessAuth> result =
            await authRepository.signIn();
        expect(result, const Left<Failure, SuccessAuth>(authFailureOther));
      },
    );

    test(
      'authRepository.signIn should return AuthenticationFailure.googleSignIn when failed to get authTokens',
      () async* {
        when(mockAuthRemoteDataSource.googleSignIn()).thenAnswer((_) async =>
            throw const ExceptionAuth(
                failureReason: AuthFailureReason.googleSignIn));
        final Either<Failure, SuccessAuth> result =
            await authRepository.signIn();
        expect(
            result, const Left<Failure, SuccessAuth>(authFailureGoogleSignIn));
      },
    );

    test(
      'authRepository.signIn should return AuthenticationLocalDataSourceFailure when failed to store user credentials',
      () async* {
        when(mockAuthLocalDataSource.storeUserCredentials(userCredentials))
            .thenAnswer((_) async => throw AuthLocalDataSourceException());
        final Either<Failure, SuccessAuth> result =
            await authRepository.signIn();
        expect(
            result, const Left<Failure, SuccessAuth>(authFailureGoogleSignIn));
      },
    );
  });

  group('Is registration complete tests', () {
    void setupSuccess() {
      when(mockAuthRemoteDataSource.isRegistrationComplete())
          .thenAnswer((_) async => Future<bool>.value(true));
    }

    void setupError() {
      when(mockAuthRemoteDataSource.isRegistrationComplete())
          .thenAnswer((_) async => throw Exception());
    }

    test(
      'authRepository.isRegistrationComplete should call authRemoteDataSource.isRegistrationComplete',
      () async* {
        setupSuccess();
        await authRepository.isRegistrationComplete();
        verify(mockAuthRemoteDataSource.isRegistrationComplete());
      },
    );

    test(
      'authRepository.isRegistrationComplete should return true when registration completed successfully',
      () async* {
        setupSuccess();
        final bool result = await authRepository.isRegistrationComplete();
        expect(result, const Right<dynamic, bool>(true));
      },
    );

    test(
      'authRepository.isRegistrationComplete should return false when registration failed',
      () async* {
        setupError();
        final bool result = await authRepository.isRegistrationComplete();
        expect(result, const Left<dynamic, bool>(false));
      },
    );
  });

  group('Sign out tests', () {
    void setupSuccess() {
      when(mockAuthRemoteDataSource.signOut()).thenAnswer((_) async {});
    }

    void setupError() {
      when(mockAuthRemoteDataSource.signOut())
          .thenAnswer((_) async => throw Exception());
    }

    test(
      'authRepository.signOut should call authRemoteDataSource.googleSignOut',
      () async* {
        setupSuccess();
        await authRepository.signOut();
        verify(mockAuthRemoteDataSource.signOut());
      },
    );

    test(
      'authRepository.signOut should return unit when user signed out successfully',
      () async* {
        setupSuccess();
        final Either<Failure, Unit> result = await authRepository.signOut();
        expect(result, const Right<Failure, Unit>(unit));
      },
    );

    test(
      'authRepository.signOut should return signOutError when sign out failed',
      () async* {
        setupError();
        final Either<Failure, Unit> result = await authRepository.signOut();
        expect(result, const Left<Failure, Unit>(Failure.signOutError()));
      },
    );
  });
}
