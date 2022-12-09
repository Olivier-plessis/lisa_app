import 'package:app_authentication/authentication.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:lisa_app/common/datas/repositories/book_repository.dart';
import 'package:lisa_app/common/domain/models/book/single_book.dart';
import 'package:lisa_app/common/domain/state/book/single_book_state.dart';

class SingleBookNotifier extends StateNotifier<SingleBookState> {
  SingleBookNotifier(
    this._bookRepository, {
    required this.bookId,
  }) : super(const SingleBookState.loading()) {
    showBooksDetails();
  }

  final String bookId;
  final BookRepository _bookRepository;

  Future<void> showBooksDetails() async {
    state = const SingleBookState.loading();

    final Either<Failure, SingleBook> result =
        await _bookRepository.showBooksDetails(id: bookId);

    state = result.fold((Failure l) => SingleBookState.error(error: l),
        (SingleBook data) => SingleBookState.data(book: data));
  }
}
