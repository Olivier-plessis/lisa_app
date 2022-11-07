import 'package:app_authentication/common/domain/states/states.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_auth.freezed.dart';

@freezed
abstract class MainState with _$MainState {
  const factory MainState.initial() = _Initial;
  const factory MainState.authenticating() = _Authenticating;
  const factory MainState.unauthenticated() = _Unauthenticated;
  const factory MainState.authenticated() = _Authenticated;
  const factory MainState.savedUser() = _SavedUser;
  const factory MainState.signedOut() = _SignedOut;
  const factory MainState.failure(Failure failure) = _Failure;
}
