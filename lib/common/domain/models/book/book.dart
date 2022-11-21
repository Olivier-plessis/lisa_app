import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:lisa_app/common/domain/models/book/items.dart';

part 'book.freezed.dart';
part 'book.g.dart';

@freezed
class Books with _$Books {
  const factory Books.data({
    List<Book>? books,
  }) = _Books;

  factory Books.fromJson(Map<String, dynamic> json) => _$BooksFromJson(json);
}

@freezed
class Book with _$Book {
  const factory Book({
    required String kind,
    int? totalItems,
    required List<Items>? items,
  }) = _Book;

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
}
