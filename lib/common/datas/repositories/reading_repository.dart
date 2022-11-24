import 'package:app_authentication/authentication.dart';
import 'package:app_authentication/common/domain/states/data_source_exception.dart';
import 'package:dartz/dartz.dart';

import 'package:lisa_app/common/datas/datasources/reading_data_sources.dart';
import 'package:lisa_app/common/domain/models/book/single_book.dart';

abstract class IFavoriteRepository {
  Future<Either<Failure, Unit>> addBookToReadingList(
      {required SingleBook book});
  Future<Either<Failure, Unit>> removeFromReadingList(
      {required SingleBook book});
  Stream<Either<Failure, List<SingleBook>>> getReadingBooks();
}

class ReadingRepository implements IFavoriteRepository {
  ReadingRepository(
    this._readingRemoteDataSource,
  );
  final ReadingDataSource _readingRemoteDataSource;

  @override
  Future<Either<Failure, Unit>> addBookToReadingList(
      {required SingleBook book}) async {
    try {
      final Unit response =
          await _readingRemoteDataSource.addBookToReadingList(book: book);

      return right(response);
    } on DataSourceException catch (_) {
      return left(const Failure.serverError());
    }
  }

  @override
  Stream<Either<Failure, List<SingleBook>>> getReadingBooks() async* {
    try {
      await for (final List<SingleBook> event
          in _readingRemoteDataSource.getReadingBooks()) {
        yield right(event);
      }
    } on DataSourceException catch (_) {
      yield left(const Failure.serverError());
    }
  }

  @override
  Future<Either<Failure, Unit>> removeFromReadingList(
      {required SingleBook book}) async {
    try {
      final Unit response =
          await _readingRemoteDataSource.removeFromReadingList(book: book);
      return right(response);
    } on DataSourceException catch (_) {
      return left(const Failure.serverError());
    }
  }
}
