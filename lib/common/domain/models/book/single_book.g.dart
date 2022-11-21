// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SingleBook _$$_SingleBookFromJson(Map<String, dynamic> json) =>
    _$_SingleBook(
      kind: json['kind'] as String? ?? '',
      id: json['id'] as String? ?? '',
      volumeInfo: SingleBook._singleVolumeInfoFromJson(
          json['volumeInfo'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$$_SingleBookToJson(_$_SingleBook instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'id': instance.id,
      'volumeInfo': SingleBook._singleVolumeInfoToJson(instance.volumeInfo),
    };
