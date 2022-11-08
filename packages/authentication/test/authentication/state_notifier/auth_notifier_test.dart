import 'package:app_authentication/common/datas/interfaces/interfaces.dart';
import 'package:app_authentication/common/datas/states/state.dart';
import 'package:app_authentication/common/domain/models/models.dart';
import 'package:app_authentication/common/domain/notifier/auth_notifier.dart';
import 'package:app_authentication/common/domain/states/states.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:state_notifier_test/state_notifier_test.dart';

import 'auth_notifier_test.mocks.dart';

// Mock dependencies
@GenerateMocks(<Type>[IUserProvider, IAuthRepository, IUserRepository])
void main() {
  late IUserProvider userProvider;
  late IAuthRepository authRepo;
  late IUserRepository userRepository;

  setUp(() {
    userProvider = MockIUserProvider();
    authRepo = MockIAuthRepository();
    userRepository = MockIUserRepository();
  });

  SuccessAuth getAuthSuccessWithCompletedRegistration() {
    return const SuccessAuth(
      registrationComplete: true,
      user: User(
        id: '1',
        email: 'johndoe@gmail.com',
        name: 'john doe',
        photo: 'https://picsum.photos/200/300',
      ),
    );
  }

  SuccessAuth getAuthSuccessWithUncompletedRegistration() {
    return const SuccessAuth(
      registrationComplete: false,
      user: User(
        id: '1',
        email: 'johndoe@gmail.com',
        name: 'john doe',
        photo: 'https://picsum.photos/200/300',
      ),
    );
  }

  User getMockedUser() {
    return const User(
      id: '1',
      email: 'johndoe@gmail.com',
      name: 'john doe',
      photo: 'https://picsum.photos/200/300',
    );
  }

  stateNotifierTest<AuthNotifier, AuthState>(
    'Emits [] when no methods are called',
    // Arrange - create notifier
    build: () => AuthNotifier(userProvider, authRepo, userRepository),
    // Act - call the methods
    actions: (_) {},
    // Assert
    expect: () => [],
  );

  group('sign in tests', () {
    stateNotifierTest<AuthNotifier, AuthState>(
      'Emits [AuthState.authenticated] when user is already registered and has successfully logged in',
      // Arrange - create notifier
      build: () => AuthNotifier(userProvider, authRepo, userRepository),
      // Arrange - set up dependencies
      setUp: () async {
        when(authRepo.signIn()).thenAnswer(
          (_) async => Future<Either<Failure, SuccessAuth>>.value(
            right(getAuthSuccessWithCompletedRegistration()),
          ),
        );
      },
      // Act - call the methods
      actions: (AuthNotifier stateNotifier) => stateNotifier.signIn(),
      // Assert
      expect: () => <AuthState>[
        const AuthState.authenticated(),
      ],
    );

    stateNotifierTest<AuthNotifier, AuthState>(
      'Emits [AuthState.failure] when user has not successfully logged in',
      build: () => AuthNotifier(userProvider, authRepo, userRepository),
      setUp: () async {
        when(authRepo.signIn()).thenAnswer(
          (_) async => Future<Either<Failure, SuccessAuth>>.value(
            left(
              const Failure.authenticationFailure(
                  AuthFailureReason.googleSignIn),
            ),
          ),
        );
      },
      actions: (AuthNotifier stateNotifier) async => stateNotifier.signIn(),
      expect: () => <AuthState>[
        const AuthState.failure(
            Failure.authenticationFailure(AuthFailureReason.googleSignIn)),
      ],
    );

    stateNotifierTest<AuthNotifier, AuthState>(
      'Emits [AuthState.savedUser,AuthState.authenticated] when user is not registered and has successfully logged in and successfully saved user in the firebase',
      build: () => AuthNotifier(userProvider, authRepo, userRepository),
      setUp: () async {
        when(authRepo.signIn()).thenAnswer(
          (_) async => Future<Either<Failure, SuccessAuth>>.value(
            right(getAuthSuccessWithUncompletedRegistration()),
          ),
        );

        when(userRepository.createUser(user: getMockedUser())).thenAnswer(
          (_) async => Future<Either<Failure, User>>.value(
            right(
              getMockedUser(),
            ),
          ),
        );
      },
      actions: (AuthNotifier stateNotifier) async => stateNotifier.signIn(),
      expect: () => <AuthState>[
        const AuthState.savedUser(),
        const AuthState.authenticated(),
      ],
    );

    stateNotifierTest<AuthNotifier, AuthState>(
      'Emits [AuthState.savedUser,AuthState.authenticated] when user is not registered and has successfully logged in and successfully saved user in the firebase',
      build: () => AuthNotifier(userProvider, authRepo, userRepository),
      setUp: () async {
        when(authRepo.signIn()).thenAnswer(
          (_) async => Future<Either<Failure, SuccessAuth>>.value(
            right(getAuthSuccessWithUncompletedRegistration()),
          ),
        );

        when(userRepository.createUser(user: getMockedUser())).thenAnswer(
          (_) async => Future<Either<Failure, User>>.value(
            left(
              const Failure.authenticationFailure(AuthFailureReason.other),
            ),
          ),
        );
      },
      actions: (AuthNotifier stateNotifier) async => stateNotifier.signIn(),
      expect: () => <AuthState>[
        const AuthState.failure(
            Failure.authenticationFailure(AuthFailureReason.other)),
        const AuthState.authenticated(),
      ],
    );
  });

  group('check if authenticated tests', () {
    stateNotifierTest<AuthNotifier, AuthState>(
      'Emits [AuthState.loading,AuthState.authenticated] when registration is commpleted',
      build: () => AuthNotifier(userProvider, authRepo, userRepository),
      setUp: () async {
        when(authRepo.isRegistrationComplete()).thenAnswer(
            (Invocation realInvocation) => Future<bool>.value(true));
        when(userProvider.setup()).thenAnswer(
            (Invocation realInvocation) => Future<bool>.value(true));
      },
      actions: (AuthNotifier stateNotifier) =>
          stateNotifier.checkIfAuthenticated(),
      expect: () => <AuthState>[
        const AuthState.authenticating(),
        const AuthState.authenticated(),
      ],
    );

    stateNotifierTest<AuthNotifier, AuthState>(
      'Emits [AuthState.loading,AuthState.unauthenticated] when registration is not completed',
      build: () => AuthNotifier(userProvider, authRepo, userRepository),
      setUp: () async {
        when(authRepo.isRegistrationComplete()).thenAnswer(
            (Invocation realInvocation) => Future<bool>.value(false));
        when(userProvider.setup()).thenAnswer(
            (Invocation realInvocation) => Future<bool>.value(true));
      },
      actions: (AuthNotifier stateNotifier) =>
          stateNotifier.checkIfAuthenticated(),
      expect: () => <AuthState>[
        const AuthState.authenticating(),
        const AuthState.unauthenticated(),
      ],
    );
  });

  group('sign out tests', () {
    stateNotifierTest<AuthNotifier, AuthState>(
      'Emits [AuthState.unauthenticated] when user signed out successfully',
      build: () => AuthNotifier(userProvider, authRepo, userRepository),
      setUp: () async {
        when(authRepo.signOut()).thenAnswer(
            (_) => Future<Either<Failure, Unit>>.value(right(unit)));
      },
      actions: (AuthNotifier stateNotifier) async {
        await stateNotifier.signOut();
      },
      expect: () => <AuthState>[
        const AuthState.signedOut(),
      ],
    );
    stateNotifierTest<AuthNotifier, AuthState>(
      'Emits [AuthState.failure(Failure.signOutError())] when user signed out failed',
      build: () => AuthNotifier(userProvider, authRepo, userRepository),
      setUp: () async {
        when(authRepo.signOut()).thenAnswer((_) =>
            Future<Either<Failure, Unit>>.value(
                const Left<Failure, Unit>(Failure.signOutError())));
      },
      actions: (AuthNotifier stateNotifier) async {
        await stateNotifier.signOut();
      },
      expect: () => <AuthState>[
        const AuthState.failure(Failure.signOutError()),
      ],
    );
  });
}
