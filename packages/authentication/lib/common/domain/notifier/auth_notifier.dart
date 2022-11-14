import 'package:app_authentication/common/datas/interfaces/interfaces.dart';
import 'package:app_authentication/common/datas/states/state.dart';
import 'package:app_authentication/common/domain/models/models.dart';
import 'package:app_authentication/common/domain/states/states.dart';
import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier(
    this._userProvider,
    this._authRepo,
    this._userRepository,
  ) : super(const AuthState.initial());

  final IUserProvider _userProvider;
  final IAuthRepository _authRepo;
  final IUserRepository _userRepository;
  Future<void> checkIfAuthenticated() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    state = const AuthState.authenticating();
    final bool regComplete = await _authRepo.isRegistrationComplete();

    if (regComplete) {
      await _userProvider.setup();
      state = const AuthState.authenticated();
    } else {
      state = const AuthState.unauthenticated();
    }
  }

  Future<void> signIn() async {
    final Either<Failure, SuccessAuth> signInResult = await _authRepo.signIn();

    await signInResult.fold(
      (Failure failure) async {
        state = AuthState.failure(failure);
      },
      (SuccessAuth success) async {
        if (!success.registrationComplete) {
          await _setNewUser(success.user);
        }
        state = const AuthState.authenticated();
      },
    );
  }

  Future<void> _setNewUser(User user) async {
    final Either<Failure, User> userResult =
        await _userRepository.createUser(user: user);
    state = userResult.fold(
      (Failure failure) => AuthState.failure(failure),
      (User success) => const AuthState.savedUser(),
    );
  }

  Future<void> signOut() async {
    final Either<Failure, Unit> result = await _authRepo.signOut();
    state = result.fold(
      (Failure failure) => AuthState.failure(failure),
      (Unit success) => const AuthState.signedOut(),
    );
  }
}
