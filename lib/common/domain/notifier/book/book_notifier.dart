import 'package:app_authentication/authentication.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:lisa_app/common/datas/repositories/book_repository.dart';
import 'package:lisa_app/common/domain/models/book/book.dart';
import 'package:lisa_app/common/domain/state/book/book_state.dart';

class BookNotifier extends StateNotifier<BookState> {
  BookNotifier(this._bookRepository) : super(const BookState.loading()) {
    searchBook(query);
  }

  final BookRepository _bookRepository;

  String get query => '';

  Future<void> searchBook(String query) async {
    state = const BookState.loading();

    final Either<Failure, Book> result =
        await _bookRepository.searchBook(query: query);

    state = result.fold(
        (Failure failure) => BookState.error(error: failure.failureMessage()),
        (Book data) => BookState.loaded(books: data));
  }
}
