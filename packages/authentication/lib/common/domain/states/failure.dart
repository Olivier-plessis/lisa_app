import 'package:app_authentication/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.offline() = _Offline;
  const factory Failure.authenticationFailure(AuthFailureReason reason) =
      _AuthenticationFailure;
  const factory Failure.serverError() = _ServerError;
  const factory Failure.signOutError() = _SignOutError;
  const factory Failure.unauthorizedAccess() = _UnauthorizedAccess;
  const factory Failure.unexpectedDataError() = _UnexpectedDataError;

  const factory Failure.authenticationLocalDataSourceFailure() =
      _AuthenticationLocalDataSourceFailure;
}

extension FailureMapper on Failure {
  String failureMessage() => map(
        offline: (_Offline s) =>
            LocaleKeys.you_have_no_internet_connection.tr(),
        authenticationFailure: (_AuthenticationFailure s) =>
            LocaleKeys.authentication_failure.tr(),
        serverError: (_ServerError s) =>
            LocaleKeys.server_error_has_occurred.tr(),
        unauthorizedAccess: (_UnauthorizedAccess s) =>
            LocaleKeys.unauthorized_access.tr(),
        unexpectedDataError: (_UnexpectedDataError s) =>
            LocaleKeys.unexpected_data_error.tr(),
        signOutError: (_SignOutError s) => LocaleKeys.sign_out_error.tr(),
        authenticationLocalDataSourceFailure:
            (_AuthenticationLocalDataSourceFailure s) =>
                LocaleKeys.authentication_local_data_source_error.tr(),
      );
}

enum AuthFailureReason {
  googleSignIn,
  other,
}

extension LocalizedAuthFailure on AuthFailureReason {
  String getLocalized(BuildContext context) {
    switch (this) {
      case AuthFailureReason.googleSignIn:
        return LocaleKeys.google_sign_fail.tr();
      case AuthFailureReason.other:
        return 'Ooops !';
    }
  }
}
