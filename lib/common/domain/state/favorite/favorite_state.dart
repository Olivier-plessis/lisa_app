import 'package:app_authentication/authentication.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:lisa_app/common/domain/models/book/single_book.dart';

part 'favorite_state.freezed.dart';

@freezed
class FavoriteState with _$FavoriteState {
  const factory FavoriteState.initial() = _Initial;
  const factory FavoriteState.submitting() = _Submitting;
  const factory FavoriteState.data({required SingleBook book}) = _Data;
  const factory FavoriteState.error({required Failure error}) = _Error;
}
