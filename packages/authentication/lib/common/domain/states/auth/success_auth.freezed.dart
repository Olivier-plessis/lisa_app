// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'success_auth.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SuccessAuth {
  bool get registrationComplete => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SuccessAuthCopyWith<SuccessAuth> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuccessAuthCopyWith<$Res> {
  factory $SuccessAuthCopyWith(
          SuccessAuth value, $Res Function(SuccessAuth) then) =
      _$SuccessAuthCopyWithImpl<$Res, SuccessAuth>;
  @useResult
  $Res call({bool registrationComplete, User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$SuccessAuthCopyWithImpl<$Res, $Val extends SuccessAuth>
    implements $SuccessAuthCopyWith<$Res> {
  _$SuccessAuthCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? registrationComplete = null,
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      registrationComplete: null == registrationComplete
          ? _value.registrationComplete
          : registrationComplete // ignore: cast_nullable_to_non_nullable
              as bool,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SuccessAuthCopyWith<$Res>
    implements $SuccessAuthCopyWith<$Res> {
  factory _$$_SuccessAuthCopyWith(
          _$_SuccessAuth value, $Res Function(_$_SuccessAuth) then) =
      __$$_SuccessAuthCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool registrationComplete, User user});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$_SuccessAuthCopyWithImpl<$Res>
    extends _$SuccessAuthCopyWithImpl<$Res, _$_SuccessAuth>
    implements _$$_SuccessAuthCopyWith<$Res> {
  __$$_SuccessAuthCopyWithImpl(
      _$_SuccessAuth _value, $Res Function(_$_SuccessAuth) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? registrationComplete = null,
    Object? user = null,
  }) {
    return _then(_$_SuccessAuth(
      registrationComplete: null == registrationComplete
          ? _value.registrationComplete
          : registrationComplete // ignore: cast_nullable_to_non_nullable
              as bool,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class _$_SuccessAuth implements _SuccessAuth {
  const _$_SuccessAuth(
      {required this.registrationComplete, required this.user});

  @override
  final bool registrationComplete;
  @override
  final User user;

  @override
  String toString() {
    return 'SuccessAuth(registrationComplete: $registrationComplete, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SuccessAuth &&
            (identical(other.registrationComplete, registrationComplete) ||
                other.registrationComplete == registrationComplete) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, registrationComplete, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SuccessAuthCopyWith<_$_SuccessAuth> get copyWith =>
      __$$_SuccessAuthCopyWithImpl<_$_SuccessAuth>(this, _$identity);
}

abstract class _SuccessAuth implements SuccessAuth {
  const factory _SuccessAuth(
      {required final bool registrationComplete,
      required final User user}) = _$_SuccessAuth;

  @override
  bool get registrationComplete;
  @override
  User get user;
  @override
  @JsonKey(ignore: true)
  _$$_SuccessAuthCopyWith<_$_SuccessAuth> get copyWith =>
      throw _privateConstructorUsedError;
}
