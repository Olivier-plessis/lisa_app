import 'dart:async';

import 'package:app_authentication/common/domain/states/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:lisa_app/common/datas/repositories/reading_repository.dart';
import 'package:lisa_app/common/domain/models/book/single_book.dart';
import 'package:lisa_app/common/domain/state/reading/reading_list_state.dart';

class ReadingListNotifier extends StateNotifier<ReadingListState> {
  ReadingListNotifier(
    this._readingRepository,
  ) : super(const ReadingListState.initial()) {
    getReadingBooks();
  }

  final ReadingRepository _readingRepository;
  late StreamSubscription<dynamic> _streamSubscription;

  Future<void> getReadingBooks() async {
    state = const ReadingListState.loading();

    _streamSubscription = _readingRepository
        .getReadingBooks()
        .listen((Either<Failure, List<SingleBook>> result) {
      state = result.fold(
        (Failure l) => ReadingListState.error(error: l),
        (List<SingleBook> r) {
          if (r.isEmpty)
            return const ReadingListState.empty(singleBooks: <SingleBook>[]);
          return ReadingListState.loaded(singleBooks: r);
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
