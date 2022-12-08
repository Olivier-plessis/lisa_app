// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Items _$$_ItemsFromJson(Map<String, dynamic> json) => _$_Items(
      id: json['id'] as String,
      selfLink: json['selfLink'] as String?,
      volumeInfo: json['volumeInfo'] == null
          ? null
          : VolumeInfo.fromJson(json['volumeInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ItemsToJson(_$_Items instance) => <String, dynamic>{
      'id': instance.id,
      'selfLink': instance.selfLink,
      'volumeInfo': instance.volumeInfo?.toJson(),
    };

_$_VolumeInfo _$$_VolumeInfoFromJson(Map<String, dynamic> json) =>
    _$_VolumeInfo(
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      authors:
          (json['authors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      publisher: json['publisher'] as String?,
      publishedDate: json['publishedDate'] as String?,
      description: json['description'] as String?,
      pageCount: json['pageCount'] as int?,
      averageRating: (json['averageRating'] as num?)?.toDouble(),
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      imageLinks: json['imageLinks'] == null
          ? null
          : ImageLinks.fromJson(json['imageLinks'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_VolumeInfoToJson(_$_VolumeInfo instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'authors': instance.authors,
      'publisher': instance.publisher,
      'publishedDate': instance.publishedDate,
      'description': instance.description,
      'pageCount': instance.pageCount,
      'averageRating': instance.averageRating,
      'categories': instance.categories,
      'imageLinks': instance.imageLinks?.toJson(),
    };

_$_ImageLinks _$$_ImageLinksFromJson(Map<String, dynamic> json) =>
    _$_ImageLinks(
      smallThumbnail: json['smallThumbnail'] as String?,
      thumbnail: json['thumbnail'] as String?,
    );

Map<String, dynamic> _$$_ImageLinksToJson(_$_ImageLinks instance) =>
    <String, dynamic>{
      'smallThumbnail': instance.smallThumbnail,
      'thumbnail': instance.thumbnail,
    };
