import 'dart:async';

import 'package:app_authentication/common/domain/states/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:lisa_app/common/datas/repositories/reading_repository.dart';
import 'package:lisa_app/common/domain/models/book/single_book.dart';
import 'package:lisa_app/common/domain/state/book/single_book_list_state.dart';

class ReadingListNotifier extends StateNotifier<SingleBookListState> {
  ReadingListNotifier(
    this._readingRepository,
  ) : super(const SingleBookListState.initial()) {
    getReadingBooks();
  }

  final ReadingRepository _readingRepository;
  late StreamSubscription<dynamic> _streamSubscription;

  Future<void> getReadingBooks() async {
    state = const SingleBookListState.loading();

    _streamSubscription = _readingRepository
        .getReadingBooks()
        .listen((Either<Failure, List<SingleBook>> result) {
      state = result.fold(
        (Failure l) => SingleBookListState.error(error: l),
        (List<SingleBook> r) {
          if (r.isEmpty)
            return const SingleBookListState.empty(singleBooks: <SingleBook>[]);
          return SingleBookListState.loaded(singleBooks: r);
        },
      );
    });
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }
}
