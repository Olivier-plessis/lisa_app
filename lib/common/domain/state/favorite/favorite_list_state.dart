import 'package:app_authentication/authentication.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:lisa_app/common/domain/models/book/single_book.dart';

part 'favorite_list_state.freezed.dart';

@freezed
class FavoriteListState with _$FavoriteListState {
  const factory FavoriteListState.initial() = _Initial;
  const factory FavoriteListState.loading() = _Loading;
  const factory FavoriteListState.loaded(
      {required List<SingleBook> singleBooks}) = _Loaded;
  const factory FavoriteListState.empty(
      {required List<SingleBook> singleBooks}) = _Empty;
  const factory FavoriteListState.error({required Failure error}) = _Error;
}
