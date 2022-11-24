import 'dart:async';

import 'package:app_authentication/common/domain/states/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:lisa_app/common/datas/repositories/favorite_repository.dart';
import 'package:lisa_app/common/domain/models/book/single_book.dart';
import 'package:lisa_app/common/domain/state/favorite/favorite_list_state.dart';

class FavoriteListNotifier extends StateNotifier<FavoriteListState> {
  FavoriteListNotifier(
    this._favoriteRepository,
  ) : super(const FavoriteListState.initial()) {
    getFavorites();
  }

  final FavoriteRepository _favoriteRepository;
  late StreamSubscription<dynamic> _streamSubscription;

  Future<void> getFavorites() async {
    state = const FavoriteListState.loading();

    _streamSubscription = _favoriteRepository
        .getFavorites()
        .listen((Either<Failure, List<SingleBook>> result) {
      state = result.fold(
        (Failure l) => FavoriteListState.error(error: l),
        (List<SingleBook> r) {
          if (r.isEmpty)
            return const FavoriteListState.empty(singleBooks: <SingleBook>[]);
          return FavoriteListState.loaded(singleBooks: r);
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
