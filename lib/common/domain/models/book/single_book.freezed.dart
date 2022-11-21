// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'single_book.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SingleBook _$SingleBookFromJson(Map<String, dynamic> json) {
  return _SingleBook.fromJson(json);
}

/// @nodoc
mixin _$SingleBook {
  String get kind => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  @JsonKey(
      fromJson: SingleBook._singleVolumeInfoFromJson,
      toJson: SingleBook._singleVolumeInfoToJson)
  SingleVolumeInfo? get volumeInfo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SingleBookCopyWith<SingleBook> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SingleBookCopyWith<$Res> {
  factory $SingleBookCopyWith(
          SingleBook value, $Res Function(SingleBook) then) =
      _$SingleBookCopyWithImpl<$Res, SingleBook>;
  @useResult
  $Res call(
      {String kind,
      String id,
      @JsonKey(fromJson: SingleBook._singleVolumeInfoFromJson, toJson: SingleBook._singleVolumeInfoToJson)
          SingleVolumeInfo? volumeInfo});

  $SingleVolumeInfoCopyWith<$Res>? get volumeInfo;
}

/// @nodoc
class _$SingleBookCopyWithImpl<$Res, $Val extends SingleBook>
    implements $SingleBookCopyWith<$Res> {
  _$SingleBookCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kind = null,
    Object? id = null,
    Object? volumeInfo = freezed,
  }) {
    return _then(_value.copyWith(
      kind: null == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      volumeInfo: freezed == volumeInfo
          ? _value.volumeInfo
          : volumeInfo // ignore: cast_nullable_to_non_nullable
              as SingleVolumeInfo?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SingleVolumeInfoCopyWith<$Res>? get volumeInfo {
    if (_value.volumeInfo == null) {
      return null;
    }

    return $SingleVolumeInfoCopyWith<$Res>(_value.volumeInfo!, (value) {
      return _then(_value.copyWith(volumeInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SingleBookCopyWith<$Res>
    implements $SingleBookCopyWith<$Res> {
  factory _$$_SingleBookCopyWith(
          _$_SingleBook value, $Res Function(_$_SingleBook) then) =
      __$$_SingleBookCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String kind,
      String id,
      @JsonKey(fromJson: SingleBook._singleVolumeInfoFromJson, toJson: SingleBook._singleVolumeInfoToJson)
          SingleVolumeInfo? volumeInfo});

  @override
  $SingleVolumeInfoCopyWith<$Res>? get volumeInfo;
}

/// @nodoc
class __$$_SingleBookCopyWithImpl<$Res>
    extends _$SingleBookCopyWithImpl<$Res, _$_SingleBook>
    implements _$$_SingleBookCopyWith<$Res> {
  __$$_SingleBookCopyWithImpl(
      _$_SingleBook _value, $Res Function(_$_SingleBook) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kind = null,
    Object? id = null,
    Object? volumeInfo = freezed,
  }) {
    return _then(_$_SingleBook(
      kind: null == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      volumeInfo: freezed == volumeInfo
          ? _value.volumeInfo
          : volumeInfo // ignore: cast_nullable_to_non_nullable
              as SingleVolumeInfo?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SingleBook implements _SingleBook {
  const _$_SingleBook(
      {this.kind = '',
      this.id = '',
      @JsonKey(fromJson: SingleBook._singleVolumeInfoFromJson, toJson: SingleBook._singleVolumeInfoToJson)
          this.volumeInfo});

  factory _$_SingleBook.fromJson(Map<String, dynamic> json) =>
      _$$_SingleBookFromJson(json);

  @override
  @JsonKey()
  final String kind;
  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey(
      fromJson: SingleBook._singleVolumeInfoFromJson,
      toJson: SingleBook._singleVolumeInfoToJson)
  final SingleVolumeInfo? volumeInfo;

  @override
  String toString() {
    return 'SingleBook(kind: $kind, id: $id, volumeInfo: $volumeInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SingleBook &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.volumeInfo, volumeInfo) ||
                other.volumeInfo == volumeInfo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, kind, id, volumeInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SingleBookCopyWith<_$_SingleBook> get copyWith =>
      __$$_SingleBookCopyWithImpl<_$_SingleBook>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SingleBookToJson(
      this,
    );
  }
}

abstract class _SingleBook implements SingleBook {
  const factory _SingleBook(
      {final String kind,
      final String id,
      @JsonKey(fromJson: SingleBook._singleVolumeInfoFromJson, toJson: SingleBook._singleVolumeInfoToJson)
          final SingleVolumeInfo? volumeInfo}) = _$_SingleBook;

  factory _SingleBook.fromJson(Map<String, dynamic> json) =
      _$_SingleBook.fromJson;

  @override
  String get kind;
  @override
  String get id;
  @override
  @JsonKey(
      fromJson: SingleBook._singleVolumeInfoFromJson,
      toJson: SingleBook._singleVolumeInfoToJson)
  SingleVolumeInfo? get volumeInfo;
  @override
  @JsonKey(ignore: true)
  _$$_SingleBookCopyWith<_$_SingleBook> get copyWith =>
      throw _privateConstructorUsedError;
}
