import 'package:freezed_annotation/freezed_annotation.dart';

import '../states.dart';

part 'exception_auth.freezed.dart';

@freezed
abstract class ExceptionAuth with _$ExceptionAuth {
  const factory ExceptionAuth({
    required AuthFailureReason failureReason,
  }) = _ExceptionAuth;
}
