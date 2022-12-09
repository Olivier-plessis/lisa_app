import 'package:app_authentication/authentication.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:lisa_app/common/domain/models/book/single_book.dart';

part 'reading_state.freezed.dart';

@freezed
class ReadingState with _$ReadingState {
  const factory ReadingState.initial() = _Initial;
  const factory ReadingState.submitting() = _Submitting;
  const factory ReadingState.data({required SingleBook book}) = _Data;
  const factory ReadingState.error({required Failure error}) = _Error;
  const factory ReadingState.empty({required SingleBook book}) = _Empty;
}
