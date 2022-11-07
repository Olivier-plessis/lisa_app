import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure_auth.freezed.dart';

@freezed
abstract class FailureAuth with _$FailureAuth {
  const factory FailureAuth.server([String? message]) = _Server;
}
