// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'exception_auth.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ExceptionAuth {
  AuthFailureReason get failureReason => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ExceptionAuthCopyWith<ExceptionAuth> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExceptionAuthCopyWith<$Res> {
  factory $ExceptionAuthCopyWith(
          ExceptionAuth value, $Res Function(ExceptionAuth) then) =
      _$ExceptionAuthCopyWithImpl<$Res, ExceptionAuth>;
  @useResult
  $Res call({AuthFailureReason failureReason});
}

/// @nodoc
class _$ExceptionAuthCopyWithImpl<$Res, $Val extends ExceptionAuth>
    implements $ExceptionAuthCopyWith<$Res> {
  _$ExceptionAuthCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failureReason = null,
  }) {
    return _then(_value.copyWith(
      failureReason: null == failureReason
          ? _value.failureReason
          : failureReason // ignore: cast_nullable_to_non_nullable
              as AuthFailureReason,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ExceptionAuthCopyWith<$Res>
    implements $ExceptionAuthCopyWith<$Res> {
  factory _$$_ExceptionAuthCopyWith(
          _$_ExceptionAuth value, $Res Function(_$_ExceptionAuth) then) =
      __$$_ExceptionAuthCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AuthFailureReason failureReason});
}

/// @nodoc
class __$$_ExceptionAuthCopyWithImpl<$Res>
    extends _$ExceptionAuthCopyWithImpl<$Res, _$_ExceptionAuth>
    implements _$$_ExceptionAuthCopyWith<$Res> {
  __$$_ExceptionAuthCopyWithImpl(
      _$_ExceptionAuth _value, $Res Function(_$_ExceptionAuth) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failureReason = null,
  }) {
    return _then(_$_ExceptionAuth(
      failureReason: null == failureReason
          ? _value.failureReason
          : failureReason // ignore: cast_nullable_to_non_nullable
              as AuthFailureReason,
    ));
  }
}

/// @nodoc

class _$_ExceptionAuth implements _ExceptionAuth {
  const _$_ExceptionAuth({required this.failureReason});

  @override
  final AuthFailureReason failureReason;

  @override
  String toString() {
    return 'ExceptionAuth(failureReason: $failureReason)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ExceptionAuth &&
            (identical(other.failureReason, failureReason) ||
                other.failureReason == failureReason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failureReason);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ExceptionAuthCopyWith<_$_ExceptionAuth> get copyWith =>
      __$$_ExceptionAuthCopyWithImpl<_$_ExceptionAuth>(this, _$identity);
}

abstract class _ExceptionAuth implements ExceptionAuth {
  const factory _ExceptionAuth(
      {required final AuthFailureReason failureReason}) = _$_ExceptionAuth;

  @override
  AuthFailureReason get failureReason;
  @override
  @JsonKey(ignore: true)
  _$$_ExceptionAuthCopyWith<_$_ExceptionAuth> get copyWith =>
      throw _privateConstructorUsedError;
}
