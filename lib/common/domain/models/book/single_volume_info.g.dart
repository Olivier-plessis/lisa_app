// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_volume_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SingleVolumeInfo _$$_SingleVolumeInfoFromJson(Map<String, dynamic> json) =>
    _$_SingleVolumeInfo(
      title: json['title'] as String? ?? '',
      subtitle: json['subtitle'] as String? ?? '',
      authors: (json['authors'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      publisher: json['publisher'] as String? ?? '',
      publishedDate: json['publishedDate'] as String? ?? '',
      description: json['description'] as String? ?? '',
      pageCount: json['pageCount'] as int? ?? 0,
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      averageRating: (json['averageRating'] as num?)?.toDouble() ?? 0.0,
      imageLinks: SingleVolumeInfo._imageLinksFromJson(
          json['imageLinks'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$$_SingleVolumeInfoToJson(_$_SingleVolumeInfo instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'authors': instance.authors,
      'publisher': instance.publisher,
      'publishedDate': instance.publishedDate,
      'description': instance.description,
      'pageCount': instance.pageCount,
      'categories': instance.categories,
      'averageRating': instance.averageRating,
      'imageLinks': SingleVolumeInfo._imageLinksToJson(instance.imageLinks),
    };

_$_ImageLinks _$$_ImageLinksFromJson(Map<String, dynamic> json) =>
    _$_ImageLinks(
      smallThumbnail: json['smallThumbnail'] as String?,
      small: json['small'] as String?,
      medium: json['medium'] as String?,
      large: json['large'] as String?,
      extraLarge: json['extraLarge'] as String?,
    );

Map<String, dynamic> _$$_ImageLinksToJson(_$_ImageLinks instance) =>
    <String, dynamic>{
      'smallThumbnail': instance.smallThumbnail,
      'small': instance.small,
      'medium': instance.medium,
      'large': instance.large,
      'extraLarge': instance.extraLarge,
    };
