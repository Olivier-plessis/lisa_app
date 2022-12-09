// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'items.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Items _$ItemsFromJson(Map<String, dynamic> json) {
  return _Items.fromJson(json);
}

/// @nodoc
mixin _$Items {
  String get id => throw _privateConstructorUsedError;
  String? get selfLink => throw _privateConstructorUsedError;
  VolumeInfo? get volumeInfo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemsCopyWith<Items> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemsCopyWith<$Res> {
  factory $ItemsCopyWith(Items value, $Res Function(Items) then) =
      _$ItemsCopyWithImpl<$Res, Items>;
  @useResult
  $Res call({String id, String? selfLink, VolumeInfo? volumeInfo});

  $VolumeInfoCopyWith<$Res>? get volumeInfo;
}

/// @nodoc
class _$ItemsCopyWithImpl<$Res, $Val extends Items>
    implements $ItemsCopyWith<$Res> {
  _$ItemsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? selfLink = freezed,
    Object? volumeInfo = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      selfLink: freezed == selfLink
          ? _value.selfLink
          : selfLink // ignore: cast_nullable_to_non_nullable
              as String?,
      volumeInfo: freezed == volumeInfo
          ? _value.volumeInfo
          : volumeInfo // ignore: cast_nullable_to_non_nullable
              as VolumeInfo?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $VolumeInfoCopyWith<$Res>? get volumeInfo {
    if (_value.volumeInfo == null) {
      return null;
    }

    return $VolumeInfoCopyWith<$Res>(_value.volumeInfo!, (value) {
      return _then(_value.copyWith(volumeInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ItemsCopyWith<$Res> implements $ItemsCopyWith<$Res> {
  factory _$$_ItemsCopyWith(_$_Items value, $Res Function(_$_Items) then) =
      __$$_ItemsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String? selfLink, VolumeInfo? volumeInfo});

  @override
  $VolumeInfoCopyWith<$Res>? get volumeInfo;
}

/// @nodoc
class __$$_ItemsCopyWithImpl<$Res> extends _$ItemsCopyWithImpl<$Res, _$_Items>
    implements _$$_ItemsCopyWith<$Res> {
  __$$_ItemsCopyWithImpl(_$_Items _value, $Res Function(_$_Items) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? selfLink = freezed,
    Object? volumeInfo = freezed,
  }) {
    return _then(_$_Items(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      selfLink: freezed == selfLink
          ? _value.selfLink
          : selfLink // ignore: cast_nullable_to_non_nullable
              as String?,
      volumeInfo: freezed == volumeInfo
          ? _value.volumeInfo
          : volumeInfo // ignore: cast_nullable_to_non_nullable
              as VolumeInfo?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Items implements _Items {
  const _$_Items({required this.id, this.selfLink, this.volumeInfo});

  factory _$_Items.fromJson(Map<String, dynamic> json) =>
      _$$_ItemsFromJson(json);

  @override
  final String id;
  @override
  final String? selfLink;
  @override
  final VolumeInfo? volumeInfo;

  @override
  String toString() {
    return 'Items(id: $id, selfLink: $selfLink, volumeInfo: $volumeInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Items &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.selfLink, selfLink) ||
                other.selfLink == selfLink) &&
            (identical(other.volumeInfo, volumeInfo) ||
                other.volumeInfo == volumeInfo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, selfLink, volumeInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ItemsCopyWith<_$_Items> get copyWith =>
      __$$_ItemsCopyWithImpl<_$_Items>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ItemsToJson(
      this,
    );
  }
}

abstract class _Items implements Items {
  const factory _Items(
      {required final String id,
      final String? selfLink,
      final VolumeInfo? volumeInfo}) = _$_Items;

  factory _Items.fromJson(Map<String, dynamic> json) = _$_Items.fromJson;

  @override
  String get id;
  @override
  String? get selfLink;
  @override
  VolumeInfo? get volumeInfo;
  @override
  @JsonKey(ignore: true)
  _$$_ItemsCopyWith<_$_Items> get copyWith =>
      throw _privateConstructorUsedError;
}

VolumeInfo _$VolumeInfoFromJson(Map<String, dynamic> json) {
  return _VolumeInfo.fromJson(json);
}

/// @nodoc
mixin _$VolumeInfo {
  String? get title => throw _privateConstructorUsedError;
  String? get subtitle => throw _privateConstructorUsedError;
  List<String>? get authors => throw _privateConstructorUsedError;
  String? get publisher => throw _privateConstructorUsedError;
  String? get publishedDate => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int? get pageCount => throw _privateConstructorUsedError;
  double? get averageRating => throw _privateConstructorUsedError;
  List<String>? get categories => throw _privateConstructorUsedError;
  ImageLinks? get imageLinks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VolumeInfoCopyWith<VolumeInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VolumeInfoCopyWith<$Res> {
  factory $VolumeInfoCopyWith(
          VolumeInfo value, $Res Function(VolumeInfo) then) =
      _$VolumeInfoCopyWithImpl<$Res, VolumeInfo>;
  @useResult
  $Res call(
      {String? title,
      String? subtitle,
      List<String>? authors,
      String? publisher,
      String? publishedDate,
      String? description,
      int? pageCount,
      double? averageRating,
      List<String>? categories,
      ImageLinks? imageLinks});

  $ImageLinksCopyWith<$Res>? get imageLinks;
}

/// @nodoc
class _$VolumeInfoCopyWithImpl<$Res, $Val extends VolumeInfo>
    implements $VolumeInfoCopyWith<$Res> {
  _$VolumeInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? subtitle = freezed,
    Object? authors = freezed,
    Object? publisher = freezed,
    Object? publishedDate = freezed,
    Object? description = freezed,
    Object? pageCount = freezed,
    Object? averageRating = freezed,
    Object? categories = freezed,
    Object? imageLinks = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      subtitle: freezed == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      authors: freezed == authors
          ? _value.authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      publisher: freezed == publisher
          ? _value.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as String?,
      publishedDate: freezed == publishedDate
          ? _value.publishedDate
          : publishedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      pageCount: freezed == pageCount
          ? _value.pageCount
          : pageCount // ignore: cast_nullable_to_non_nullable
              as int?,
      averageRating: freezed == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double?,
      categories: freezed == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      imageLinks: freezed == imageLinks
          ? _value.imageLinks
          : imageLinks // ignore: cast_nullable_to_non_nullable
              as ImageLinks?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageLinksCopyWith<$Res>? get imageLinks {
    if (_value.imageLinks == null) {
      return null;
    }

    return $ImageLinksCopyWith<$Res>(_value.imageLinks!, (value) {
      return _then(_value.copyWith(imageLinks: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_VolumeInfoCopyWith<$Res>
    implements $VolumeInfoCopyWith<$Res> {
  factory _$$_VolumeInfoCopyWith(
          _$_VolumeInfo value, $Res Function(_$_VolumeInfo) then) =
      __$$_VolumeInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? title,
      String? subtitle,
      List<String>? authors,
      String? publisher,
      String? publishedDate,
      String? description,
      int? pageCount,
      double? averageRating,
      List<String>? categories,
      ImageLinks? imageLinks});

  @override
  $ImageLinksCopyWith<$Res>? get imageLinks;
}

/// @nodoc
class __$$_VolumeInfoCopyWithImpl<$Res>
    extends _$VolumeInfoCopyWithImpl<$Res, _$_VolumeInfo>
    implements _$$_VolumeInfoCopyWith<$Res> {
  __$$_VolumeInfoCopyWithImpl(
      _$_VolumeInfo _value, $Res Function(_$_VolumeInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? subtitle = freezed,
    Object? authors = freezed,
    Object? publisher = freezed,
    Object? publishedDate = freezed,
    Object? description = freezed,
    Object? pageCount = freezed,
    Object? averageRating = freezed,
    Object? categories = freezed,
    Object? imageLinks = freezed,
  }) {
    return _then(_$_VolumeInfo(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      subtitle: freezed == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      authors: freezed == authors
          ? _value._authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      publisher: freezed == publisher
          ? _value.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as String?,
      publishedDate: freezed == publishedDate
          ? _value.publishedDate
          : publishedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      pageCount: freezed == pageCount
          ? _value.pageCount
          : pageCount // ignore: cast_nullable_to_non_nullable
              as int?,
      averageRating: freezed == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double?,
      categories: freezed == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      imageLinks: freezed == imageLinks
          ? _value.imageLinks
          : imageLinks // ignore: cast_nullable_to_non_nullable
              as ImageLinks?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_VolumeInfo implements _VolumeInfo {
  const _$_VolumeInfo(
      {this.title,
      this.subtitle,
      final List<String>? authors,
      this.publisher,
      this.publishedDate,
      this.description,
      this.pageCount,
      this.averageRating,
      final List<String>? categories,
      this.imageLinks})
      : _authors = authors,
        _categories = categories;

  factory _$_VolumeInfo.fromJson(Map<String, dynamic> json) =>
      _$$_VolumeInfoFromJson(json);

  @override
  final String? title;
  @override
  final String? subtitle;
  final List<String>? _authors;
  @override
  List<String>? get authors {
    final value = _authors;
    if (value == null) return null;
    if (_authors is EqualUnmodifiableListView) return _authors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? publisher;
  @override
  final String? publishedDate;
  @override
  final String? description;
  @override
  final int? pageCount;
  @override
  final double? averageRating;
  final List<String>? _categories;
  @override
  List<String>? get categories {
    final value = _categories;
    if (value == null) return null;
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final ImageLinks? imageLinks;

  @override
  String toString() {
    return 'VolumeInfo(title: $title, subtitle: $subtitle, authors: $authors, publisher: $publisher, publishedDate: $publishedDate, description: $description, pageCount: $pageCount, averageRating: $averageRating, categories: $categories, imageLinks: $imageLinks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VolumeInfo &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            const DeepCollectionEquality().equals(other._authors, _authors) &&
            (identical(other.publisher, publisher) ||
                other.publisher == publisher) &&
            (identical(other.publishedDate, publishedDate) ||
                other.publishedDate == publishedDate) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.pageCount, pageCount) ||
                other.pageCount == pageCount) &&
            (identical(other.averageRating, averageRating) ||
                other.averageRating == averageRating) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.imageLinks, imageLinks) ||
                other.imageLinks == imageLinks));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      subtitle,
      const DeepCollectionEquality().hash(_authors),
      publisher,
      publishedDate,
      description,
      pageCount,
      averageRating,
      const DeepCollectionEquality().hash(_categories),
      imageLinks);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VolumeInfoCopyWith<_$_VolumeInfo> get copyWith =>
      __$$_VolumeInfoCopyWithImpl<_$_VolumeInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VolumeInfoToJson(
      this,
    );
  }
}

abstract class _VolumeInfo implements VolumeInfo {
  const factory _VolumeInfo(
      {final String? title,
      final String? subtitle,
      final List<String>? authors,
      final String? publisher,
      final String? publishedDate,
      final String? description,
      final int? pageCount,
      final double? averageRating,
      final List<String>? categories,
      final ImageLinks? imageLinks}) = _$_VolumeInfo;

  factory _VolumeInfo.fromJson(Map<String, dynamic> json) =
      _$_VolumeInfo.fromJson;

  @override
  String? get title;
  @override
  String? get subtitle;
  @override
  List<String>? get authors;
  @override
  String? get publisher;
  @override
  String? get publishedDate;
  @override
  String? get description;
  @override
  int? get pageCount;
  @override
  double? get averageRating;
  @override
  List<String>? get categories;
  @override
  ImageLinks? get imageLinks;
  @override
  @JsonKey(ignore: true)
  _$$_VolumeInfoCopyWith<_$_VolumeInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

ImageLinks _$ImageLinksFromJson(Map<String, dynamic> json) {
  return _ImageLinks.fromJson(json);
}

/// @nodoc
mixin _$ImageLinks {
  String? get smallThumbnail => throw _privateConstructorUsedError;
  String? get thumbnail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageLinksCopyWith<ImageLinks> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageLinksCopyWith<$Res> {
  factory $ImageLinksCopyWith(
          ImageLinks value, $Res Function(ImageLinks) then) =
      _$ImageLinksCopyWithImpl<$Res, ImageLinks>;
  @useResult
  $Res call({String? smallThumbnail, String? thumbnail});
}

/// @nodoc
class _$ImageLinksCopyWithImpl<$Res, $Val extends ImageLinks>
    implements $ImageLinksCopyWith<$Res> {
  _$ImageLinksCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? smallThumbnail = freezed,
    Object? thumbnail = freezed,
  }) {
    return _then(_value.copyWith(
      smallThumbnail: freezed == smallThumbnail
          ? _value.smallThumbnail
          : smallThumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ImageLinksCopyWith<$Res>
    implements $ImageLinksCopyWith<$Res> {
  factory _$$_ImageLinksCopyWith(
          _$_ImageLinks value, $Res Function(_$_ImageLinks) then) =
      __$$_ImageLinksCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? smallThumbnail, String? thumbnail});
}

/// @nodoc
class __$$_ImageLinksCopyWithImpl<$Res>
    extends _$ImageLinksCopyWithImpl<$Res, _$_ImageLinks>
    implements _$$_ImageLinksCopyWith<$Res> {
  __$$_ImageLinksCopyWithImpl(
      _$_ImageLinks _value, $Res Function(_$_ImageLinks) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? smallThumbnail = freezed,
    Object? thumbnail = freezed,
  }) {
    return _then(_$_ImageLinks(
      smallThumbnail: freezed == smallThumbnail
          ? _value.smallThumbnail
          : smallThumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ImageLinks implements _ImageLinks {
  const _$_ImageLinks({this.smallThumbnail, this.thumbnail});

  factory _$_ImageLinks.fromJson(Map<String, dynamic> json) =>
      _$$_ImageLinksFromJson(json);

  @override
  final String? smallThumbnail;
  @override
  final String? thumbnail;

  @override
  String toString() {
    return 'ImageLinks(smallThumbnail: $smallThumbnail, thumbnail: $thumbnail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ImageLinks &&
            (identical(other.smallThumbnail, smallThumbnail) ||
                other.smallThumbnail == smallThumbnail) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, smallThumbnail, thumbnail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ImageLinksCopyWith<_$_ImageLinks> get copyWith =>
      __$$_ImageLinksCopyWithImpl<_$_ImageLinks>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ImageLinksToJson(
      this,
    );
  }
}

abstract class _ImageLinks implements ImageLinks {
  const factory _ImageLinks(
      {final String? smallThumbnail, final String? thumbnail}) = _$_ImageLinks;

  factory _ImageLinks.fromJson(Map<String, dynamic> json) =
      _$_ImageLinks.fromJson;

  @override
  String? get smallThumbnail;
  @override
  String? get thumbnail;
  @override
  @JsonKey(ignore: true)
  _$$_ImageLinksCopyWith<_$_ImageLinks> get copyWith =>
      throw _privateConstructorUsedError;
}
