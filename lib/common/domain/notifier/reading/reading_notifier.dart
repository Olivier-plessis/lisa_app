import 'package:app_authentication/common/domain/states/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:lisa_app/common/datas/repositories/reading_repository.dart';
import 'package:lisa_app/common/domain/models/book/single_book.dart';
import 'package:lisa_app/common/domain/state/book/single_book_state.dart';

class ReadingNotifier extends StateNotifier<SingleBookState> {
  ReadingNotifier(
    this._readingRepository,
  ) : super(const SingleBookState.initial());

  final ReadingRepository _readingRepository;

  Future<void> addBookToReadingList({required SingleBook book}) async {
    state = const SingleBookState.submitting();

    final Either<Failure, Unit> response =
        await _readingRepository.addBookToReadingList(book: book);

    state = response.fold(
      (Failure l) => SingleBookState.error(error: l),
      (Unit r) {
        return SingleBookState.data(book: book);
      },
    );
  }

  Future<void> removeFromReadingList({required SingleBook book}) async {
    state = const SingleBookState.submitting();

    final Either<Failure, Unit> response =
        await _readingRepository.removeFromReadingList(book: book);

    state = response.fold(
      (Failure l) => SingleBookState.error(error: l),
      (Unit r) => SingleBookState.data(
        book: book,
      ),
    );
  }

  Future<void> startToReadBook({required SingleBook book}) async {
    state = const SingleBookState.submitting();

    final Either<Failure, Unit> response =
        await _readingRepository.startToReadBook(book: book);

    state = response.fold(
      (Failure l) => SingleBookState.error(error: l),
      (Unit r) => SingleBookState.data(
        book: book,
      ),
    );
  }

  Future<void> updatePageReadBook(
      {required SingleBook book, required int numberOfPageRead}) async {
    state = const SingleBookState.submitting();

    final Either<Failure, Unit> response = await _readingRepository
        .updatePageReadBook(book: book, numberOfPageRead: numberOfPageRead);

    state = response.fold(
      (Failure l) => SingleBookState.error(error: l),
      (Unit r) => SingleBookState.data(
        book: book,
      ),
    );
  }
}
