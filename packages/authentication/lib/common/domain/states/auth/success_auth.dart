import 'package:app_authentication/common/domain/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'success_auth.freezed.dart';

@freezed
abstract class SuccessAuth with _$SuccessAuth {
  const factory SuccessAuth({
    required bool registrationComplete,
    required User user,
  }) = _SuccessAuth;
}
