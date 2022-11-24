import 'package:app_authentication/authentication.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:lisa_app/common/domain/models/book/single_book.dart';

part 'reading_list_state.freezed.dart';

@freezed
class ReadingListState with _$ReadingListState {
  const factory ReadingListState.initial() = _Initial;
  const factory ReadingListState.loading() = _Loading;
  const factory ReadingListState.loaded(
      {required List<SingleBook> singleBooks}) = _Loaded;
  const factory ReadingListState.empty(
      {required List<SingleBook> singleBooks}) = _Empty;
  const factory ReadingListState.error({required Failure error}) = _Error;
}
