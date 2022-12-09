import 'dart:async';

import 'package:app_authentication/common/domain/states/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:lisa_app/common/datas/repositories/favorite_repository.dart';
import 'package:lisa_app/common/domain/models/book/single_book.dart';
import 'package:lisa_app/common/domain/state/book/single_book_list_state.dart';

class FavoriteListNotifier extends StateNotifier<SingleBookListState> {
  FavoriteListNotifier(
    this._favoriteRepository,
  ) : super(const SingleBookListState.initial()) {
    getFavorites();
  }

  final FavoriteRepository _favoriteRepository;
  late StreamSubscription<dynamic> _streamSubscription;

  Future<void> getFavorites() async {
    state = const SingleBookListState.loading();

    _streamSubscription = _favoriteRepository
        .getFavorites()
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
