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

enum FilterBooks { pending, inProgress, isFinished }

extension FilterExtension on FilterBooks {
  String getFiltersBooks() {
    switch (this) {
      case FilterBooks.pending:
        return 'pending';
      case FilterBooks.inProgress:
        return 'in progress';
      case FilterBooks.isFinished:
        return 'finished';
    }
  }
}

List<String> getListOfFilters() => ['pending', 'in progress', 'finished'];
