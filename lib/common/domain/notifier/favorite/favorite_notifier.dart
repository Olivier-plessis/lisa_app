import 'package:app_authentication/common/domain/states/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:lisa_app/common/datas/repositories/favorite_repository.dart';
import 'package:lisa_app/common/domain/models/book/single_book.dart';
import 'package:lisa_app/common/domain/state/book/single_book_state.dart';

class FavoriteNotifier extends StateNotifier<SingleBookState> {
  FavoriteNotifier(this._favouriteRepository)
      : super(const SingleBookState.initial());

  final FavoriteRepository _favouriteRepository;

  Future<void> addToFavorites({required SingleBook book}) async {
    state = const SingleBookState.submitting();
    final Either<Failure, Unit> response =
        await _favouriteRepository.addToFavorites(book: book);

    state = response.fold(
      (Failure l) => SingleBookState.error(error: l),
      (Unit r) => SingleBookState.data(book: book),
    );
  }

  Future<void> removeFromFavorites({required SingleBook book}) async {
    state = const SingleBookState.submitting();
    final Either<Failure, Unit> response =
        await _favouriteRepository.removeFromFavorites(book: book);

    state = response.fold(
      (Failure l) => SingleBookState.error(error: l),
      (Unit r) => SingleBookState.data(
        book: book,
      ),
    );
  }
}
