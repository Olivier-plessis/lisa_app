import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:lisa_app/common/domain/models/book/book.dart';

part 'book_state.freezed.dart';

@freezed
class BookState with _$BookState {
  const factory BookState.initial() = _Initial;
  const factory BookState.loading() = _Loading;
  const factory BookState.loaded({required Book books}) = _Loaded;

  const factory BookState.error({required String error}) = _Error;
}
