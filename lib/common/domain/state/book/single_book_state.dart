import 'package:app_authentication/authentication.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:lisa_app/common/domain/models/book/single_book.dart';

part 'single_book_state.freezed.dart';

@freezed
class SingleBookState with _$SingleBookState {
  const factory SingleBookState.initial() = _Initial;
  const factory SingleBookState.loading() = _Loading;
  const factory SingleBookState.submitting() = _Submitting;
  const factory SingleBookState.data({required SingleBook book}) = _Data;
  const factory SingleBookState.error({required Failure error}) = _Error;
  const factory SingleBookState.empty({required SingleBook book}) = _Empty;
}
