import 'package:app_authentication/authentication.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:lisa_app/common/domain/models/book/single_book.dart';

part 'single_book_list_state.freezed.dart';

@freezed
class SingleBookListState with _$SingleBookListState {
  const factory SingleBookListState.initial() = _Initial;
  const factory SingleBookListState.loading() = _Loading;
  const factory SingleBookListState.loaded(
      {required List<SingleBook> singleBooks}) = _Loaded;
  const factory SingleBookListState.empty(
      {required List<SingleBook> singleBooks}) = _Empty;
  const factory SingleBookListState.error({required Failure error}) = _Error;
}
