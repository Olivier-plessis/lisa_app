import 'package:app_authentication/common/domain/states/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:lisa_app/common/datas/datasources/api_google_client.dart';
import 'package:lisa_app/common/datas/interfaces/book_impl.dart';
import 'package:lisa_app/common/domain/models/book/book.dart';
import 'package:lisa_app/common/domain/models/book/single_book.dart';

class BookRepository implements IBookRepository {
  BookRepository(
    this._api,
  );

  final ApiGoogleClient _api;

  @override
  Future<Either<Failure, Book>> searchBook({required String query}) async {
    try {
      final Book response =
          await _api.searchBooks(query.trim().replaceAll(' ', '+'));

      return right(response);
    } on DioError catch (e) {
      return left(e.handleFailure());
    }
  }

  @override
  Future<Either<Failure, SingleBook>> showBooksDetails(
      {required String id}) async {
    try {
      final SingleBook response = await _api.showBooksDetails(id);

      return right(response);
    } on DioError catch (e) {
      return left(e.handleFailure());
    }
  }
}
