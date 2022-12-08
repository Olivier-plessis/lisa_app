// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Books _$$_BooksFromJson(Map<String, dynamic> json) => _$_Books(
      books: (json['books'] as List<dynamic>?)
          ?.map((e) => Book.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_BooksToJson(_$_Books instance) => <String, dynamic>{
      'books': instance.books?.map((e) => e.toJson()).toList(),
    };

_$_Book _$$_BookFromJson(Map<String, dynamic> json) => _$_Book(
      kind: json['kind'] as String,
      totalItems: json['totalItems'] as int?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Items.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_BookToJson(_$_Book instance) => <String, dynamic>{
      'kind': instance.kind,
      'totalItems': instance.totalItems,
      'items': instance.items?.map((e) => e.toJson()).toList(),
    };
