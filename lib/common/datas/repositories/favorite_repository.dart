import 'package:app_authentication/authentication.dart';
import 'package:app_authentication/common/domain/states/data_source_exception.dart';
import 'package:dartz/dartz.dart';

import 'package:lisa_app/common/datas/datasources/favorite_data_sources.dart';
import 'package:lisa_app/common/domain/models/book/single_book.dart';

abstract class IFavoriteRepository {
  Future<Either<Failure, Unit>> addToFavorites({required SingleBook book});
  Future<Either<Failure, Unit>> removeFromFavorites({required SingleBook book});
  Stream<Either<Failure, List<SingleBook>>> getFavorites();
}

class FavoriteRepository implements IFavoriteRepository {
  FavoriteRepository(
    this._favoriteRemoteDataSource,
  );
  final FavoriteDataSource _favoriteRemoteDataSource;

  @override
  Future<Either<Failure, Unit>> addToFavorites(
      {required SingleBook book}) async {
    try {
      final Unit response =
          await _favoriteRemoteDataSource.addBookToFavorite(book: book);

      return right(response);
    } on DataSourceException catch (_) {
      return left(const Failure.serverError());
    }
  }

  @override
  Stream<Either<Failure, List<SingleBook>>> getFavorites() async* {
    try {
      await for (final List<SingleBook> event
          in _favoriteRemoteDataSource.getFavorites()) {
        yield right(event);
      }
    } on DataSourceException catch (_) {
      yield left(const Failure.serverError());
    }
  }

  @override
  Future<Either<Failure, Unit>> removeFromFavorites(
      {required SingleBook book}) async {
    try {
      final Unit response =
          await _favoriteRemoteDataSource.removeFavorite(book: book);
      return right(response);
    } on DataSourceException catch (_) {
      return left(const Failure.serverError());
    }
  }
}
