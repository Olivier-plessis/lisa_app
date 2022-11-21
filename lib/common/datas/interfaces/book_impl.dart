import 'package:app_authentication/authentication.dart';
import 'package:dartz/dartz.dart';

import 'package:lisa_app/common/domain/models/book/book.dart';
import 'package:lisa_app/common/domain/models/book/single_book.dart';

abstract class IBookRepository {
  Future<Either<Failure, Book>> searchBook({required String query});
  Future<Either<Failure, SingleBook>> showBooksDetails({required String id});
}
