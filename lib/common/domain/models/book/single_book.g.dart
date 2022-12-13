// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SingleBook _$$_SingleBookFromJson(Map<String, dynamic> json) =>
    _$_SingleBook(
      kind: json['kind'] as String? ?? '',
      id: json['id'] as String? ?? '',
      status: $enumDecodeNullable(_$BookStatusEnumMap, json['status']) ??
          BookStatus.pending,
      numberOfPageRead: json['numberOfPageRead'] as int? ?? 0,
      startedAt: const TimestampOrNullConverter()
          .fromJson(json['startedAt'] as Timestamp?),
      volumeInfo: SingleBook._singleVolumeInfoFromJson(
          json['volumeInfo'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$$_SingleBookToJson(_$_SingleBook instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'id': instance.id,
      'status': _$BookStatusEnumMap[instance.status]!,
      'numberOfPageRead': instance.numberOfPageRead,
      'startedAt': const TimestampOrNullConverter().toJson(instance.startedAt),
      'volumeInfo': SingleBook._singleVolumeInfoToJson(instance.volumeInfo),
    };

const _$BookStatusEnumMap = {
  BookStatus.pending: 'pending',
  BookStatus.inProgress: 'inProgress',
  BookStatus.isFinished: 'isFinished',
};
