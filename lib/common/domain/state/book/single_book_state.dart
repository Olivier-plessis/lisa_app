import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:lisa_app/common/domain/models/book/single_book.dart';

part 'single_book_state.freezed.dart';

@freezed
class SingleBookState with _$SingleBookState {
  const factory SingleBookState.initial() = _Initial;
  const factory SingleBookState.loading() = _Loading;
  const factory SingleBookState.loaded({required SingleBook singleBook}) =
      _Loaded;
  const factory SingleBookState.error({required String error}) = _Error;
}
