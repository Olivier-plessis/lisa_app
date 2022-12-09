// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'single_volume_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SingleVolumeInfo _$SingleVolumeInfoFromJson(Map<String, dynamic> json) {
  return _SingleVolumeInfo.fromJson(json);
}

/// @nodoc
mixin _$SingleVolumeInfo {
  String get title => throw _privateConstructorUsedError;
  String get subtitle => throw _privateConstructorUsedError;
  List<String> get authors => throw _privateConstructorUsedError;
  String get publisher => throw _privateConstructorUsedError;
  String get publishedDate => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get pageCount => throw _privateConstructorUsedError;
  List<String> get categories => throw _privateConstructorUsedError;
  double get averageRating => throw _privateConstructorUsedError;
  @JsonKey(
      fromJson: SingleVolumeInfo._imageLinksFromJson,
      toJson: SingleVolumeInfo._imageLinksToJson)
  ImageLinks? get imageLinks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SingleVolumeInfoCopyWith<SingleVolumeInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SingleVolumeInfoCopyWith<$Res> {
  factory $SingleVolumeInfoCopyWith(
          SingleVolumeInfo value, $Res Function(SingleVolumeInfo) then) =
      _$SingleVolumeInfoCopyWithImpl<$Res, SingleVolumeInfo>;
  @useResult
  $Res call(
      {String title,
      String subtitle,
      List<String> authors,
      String publisher,
      String publishedDate,
      String description,
      int pageCount,
      List<String> categories,
      double averageRating,
      @JsonKey(fromJson: SingleVolumeInfo._imageLinksFromJson, toJson: SingleVolumeInfo._imageLinksToJson)
          ImageLinks? imageLinks});

  $ImageLinksCopyWith<$Res>? get imageLinks;
}

/// @nodoc
class _$SingleVolumeInfoCopyWithImpl<$Res, $Val extends SingleVolumeInfo>
    implements $SingleVolumeInfoCopyWith<$Res> {
  _$SingleVolumeInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? subtitle = null,
    Object? authors = null,
    Object? publisher = null,
    Object? publishedDate = null,
    Object? description = null,
    Object? pageCount = null,
    Object? categories = null,
    Object? averageRating = null,
    Object? imageLinks = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: null == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
      authors: null == authors
          ? _value.authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<String>,
      publisher: null == publisher
          ? _value.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as String,
      publishedDate: null == publishedDate
          ? _value.publishedDate
          : publishedDate // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      pageCount: null == pageCount
          ? _value.pageCount
          : pageCount // ignore: cast_nullable_to_non_nullable
              as int,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      averageRating: null == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double,
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
abstract class _$$_SingleVolumeInfoCopyWith<$Res>
    implements $SingleVolumeInfoCopyWith<$Res> {
  factory _$$_SingleVolumeInfoCopyWith(
          _$_SingleVolumeInfo value, $Res Function(_$_SingleVolumeInfo) then) =
      __$$_SingleVolumeInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String subtitle,
      List<String> authors,
      String publisher,
      String publishedDate,
      String description,
      int pageCount,
      List<String> categories,
      double averageRating,
      @JsonKey(fromJson: SingleVolumeInfo._imageLinksFromJson, toJson: SingleVolumeInfo._imageLinksToJson)
          ImageLinks? imageLinks});

  @override
  $ImageLinksCopyWith<$Res>? get imageLinks;
}

/// @nodoc
class __$$_SingleVolumeInfoCopyWithImpl<$Res>
    extends _$SingleVolumeInfoCopyWithImpl<$Res, _$_SingleVolumeInfo>
    implements _$$_SingleVolumeInfoCopyWith<$Res> {
  __$$_SingleVolumeInfoCopyWithImpl(
      _$_SingleVolumeInfo _value, $Res Function(_$_SingleVolumeInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? subtitle = null,
    Object? authors = null,
    Object? publisher = null,
    Object? publishedDate = null,
    Object? description = null,
    Object? pageCount = null,
    Object? categories = null,
    Object? averageRating = null,
    Object? imageLinks = freezed,
  }) {
    return _then(_$_SingleVolumeInfo(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: null == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
      authors: null == authors
          ? _value._authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<String>,
      publisher: null == publisher
          ? _value.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as String,
      publishedDate: null == publishedDate
          ? _value.publishedDate
          : publishedDate // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      pageCount: null == pageCount
          ? _value.pageCount
          : pageCount // ignore: cast_nullable_to_non_nullable
              as int,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      averageRating: null == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double,
      imageLinks: freezed == imageLinks
          ? _value.imageLinks
          : imageLinks // ignore: cast_nullable_to_non_nullable
              as ImageLinks?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SingleVolumeInfo implements _SingleVolumeInfo {
  const _$_SingleVolumeInfo(
      {this.title = '',
      this.subtitle = '',
      final List<String> authors = const [],
      this.publisher = '',
      this.publishedDate = '',
      this.description = '',
      this.pageCount = 0,
      final List<String> categories = const [],
      this.averageRating = 0.0,
      @JsonKey(fromJson: SingleVolumeInfo._imageLinksFromJson, toJson: SingleVolumeInfo._imageLinksToJson)
          this.imageLinks})
      : _authors = authors,
        _categories = categories;

  factory _$_SingleVolumeInfo.fromJson(Map<String, dynamic> json) =>
      _$$_SingleVolumeInfoFromJson(json);

  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String subtitle;
  final List<String> _authors;
  @override
  @JsonKey()
  List<String> get authors {
    if (_authors is EqualUnmodifiableListView) return _authors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_authors);
  }

  @override
  @JsonKey()
  final String publisher;
  @override
  @JsonKey()
  final String publishedDate;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final int pageCount;
  final List<String> _categories;
  @override
  @JsonKey()
  List<String> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  @JsonKey()
  final double averageRating;
  @override
  @JsonKey(
      fromJson: SingleVolumeInfo._imageLinksFromJson,
      toJson: SingleVolumeInfo._imageLinksToJson)
  final ImageLinks? imageLinks;

  @override
  String toString() {
    return 'SingleVolumeInfo(title: $title, subtitle: $subtitle, authors: $authors, publisher: $publisher, publishedDate: $publishedDate, description: $description, pageCount: $pageCount, categories: $categories, averageRating: $averageRating, imageLinks: $imageLinks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SingleVolumeInfo &&
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
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.averageRating, averageRating) ||
                other.averageRating == averageRating) &&
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
      const DeepCollectionEquality().hash(_categories),
      averageRating,
      imageLinks);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SingleVolumeInfoCopyWith<_$_SingleVolumeInfo> get copyWith =>
      __$$_SingleVolumeInfoCopyWithImpl<_$_SingleVolumeInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SingleVolumeInfoToJson(
      this,
    );
  }
}

abstract class _SingleVolumeInfo implements SingleVolumeInfo {
  const factory _SingleVolumeInfo(
      {final String title,
      final String subtitle,
      final List<String> authors,
      final String publisher,
      final String publishedDate,
      final String description,
      final int pageCount,
      final List<String> categories,
      final double averageRating,
      @JsonKey(fromJson: SingleVolumeInfo._imageLinksFromJson, toJson: SingleVolumeInfo._imageLinksToJson)
          final ImageLinks? imageLinks}) = _$_SingleVolumeInfo;

  factory _SingleVolumeInfo.fromJson(Map<String, dynamic> json) =
      _$_SingleVolumeInfo.fromJson;

  @override
  String get title;
  @override
  String get subtitle;
  @override
  List<String> get authors;
  @override
  String get publisher;
  @override
  String get publishedDate;
  @override
  String get description;
  @override
  int get pageCount;
  @override
  List<String> get categories;
  @override
  double get averageRating;
  @override
  @JsonKey(
      fromJson: SingleVolumeInfo._imageLinksFromJson,
      toJson: SingleVolumeInfo._imageLinksToJson)
  ImageLinks? get imageLinks;
  @override
  @JsonKey(ignore: true)
  _$$_SingleVolumeInfoCopyWith<_$_SingleVolumeInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

ImageLinks _$ImageLinksFromJson(Map<String, dynamic> json) {
  return _ImageLinks.fromJson(json);
}

/// @nodoc
mixin _$ImageLinks {
  String? get smallThumbnail => throw _privateConstructorUsedError;
  String? get small => throw _privateConstructorUsedError;
  String? get medium => throw _privateConstructorUsedError;
  String? get large => throw _privateConstructorUsedError;
  String? get extraLarge => throw _privateConstructorUsedError;

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
  $Res call(
      {String? smallThumbnail,
      String? small,
      String? medium,
      String? large,
      String? extraLarge});
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
    Object? small = freezed,
    Object? medium = freezed,
    Object? large = freezed,
    Object? extraLarge = freezed,
  }) {
    return _then(_value.copyWith(
      smallThumbnail: freezed == smallThumbnail
          ? _value.smallThumbnail
          : smallThumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      small: freezed == small
          ? _value.small
          : small // ignore: cast_nullable_to_non_nullable
              as String?,
      medium: freezed == medium
          ? _value.medium
          : medium // ignore: cast_nullable_to_non_nullable
              as String?,
      large: freezed == large
          ? _value.large
          : large // ignore: cast_nullable_to_non_nullable
              as String?,
      extraLarge: freezed == extraLarge
          ? _value.extraLarge
          : extraLarge // ignore: cast_nullable_to_non_nullable
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
  $Res call(
      {String? smallThumbnail,
      String? small,
      String? medium,
      String? large,
      String? extraLarge});
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
    Object? small = freezed,
    Object? medium = freezed,
    Object? large = freezed,
    Object? extraLarge = freezed,
  }) {
    return _then(_$_ImageLinks(
      smallThumbnail: freezed == smallThumbnail
          ? _value.smallThumbnail
          : smallThumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      small: freezed == small
          ? _value.small
          : small // ignore: cast_nullable_to_non_nullable
              as String?,
      medium: freezed == medium
          ? _value.medium
          : medium // ignore: cast_nullable_to_non_nullable
              as String?,
      large: freezed == large
          ? _value.large
          : large // ignore: cast_nullable_to_non_nullable
              as String?,
      extraLarge: freezed == extraLarge
          ? _value.extraLarge
          : extraLarge // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ImageLinks implements _ImageLinks {
  const _$_ImageLinks(
      {this.smallThumbnail,
      this.small,
      this.medium,
      this.large,
      this.extraLarge});

  factory _$_ImageLinks.fromJson(Map<String, dynamic> json) =>
      _$$_ImageLinksFromJson(json);

  @override
  final String? smallThumbnail;
  @override
  final String? small;
  @override
  final String? medium;
  @override
  final String? large;
  @override
  final String? extraLarge;

  @override
  String toString() {
    return 'ImageLinks(smallThumbnail: $smallThumbnail, small: $small, medium: $medium, large: $large, extraLarge: $extraLarge)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ImageLinks &&
            (identical(other.smallThumbnail, smallThumbnail) ||
                other.smallThumbnail == smallThumbnail) &&
            (identical(other.small, small) || other.small == small) &&
            (identical(other.medium, medium) || other.medium == medium) &&
            (identical(other.large, large) || other.large == large) &&
            (identical(other.extraLarge, extraLarge) ||
                other.extraLarge == extraLarge));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, smallThumbnail, small, medium, large, extraLarge);

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
      {final String? smallThumbnail,
      final String? small,
      final String? medium,
      final String? large,
      final String? extraLarge}) = _$_ImageLinks;

  factory _ImageLinks.fromJson(Map<String, dynamic> json) =
      _$_ImageLinks.fromJson;

  @override
  String? get smallThumbnail;
  @override
  String? get small;
  @override
  String? get medium;
  @override
  String? get large;
  @override
  String? get extraLarge;
  @override
  @JsonKey(ignore: true)
  _$$_ImageLinksCopyWith<_$_ImageLinks> get copyWith =>
      throw _privateConstructorUsedError;
}
