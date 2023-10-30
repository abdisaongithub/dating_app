// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reset_password_with_phone.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ResetPasswordWithPhone _$ResetPasswordWithPhoneFromJson(
    Map<String, dynamic> json) {
  return _ResetPasswordWithPhone.fromJson(json);
}

/// @nodoc
mixin _$ResetPasswordWithPhone {
  String get password => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get firebaseJwt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResetPasswordWithPhoneCopyWith<ResetPasswordWithPhone> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetPasswordWithPhoneCopyWith<$Res> {
  factory $ResetPasswordWithPhoneCopyWith(ResetPasswordWithPhone value,
          $Res Function(ResetPasswordWithPhone) then) =
      _$ResetPasswordWithPhoneCopyWithImpl<$Res, ResetPasswordWithPhone>;
  @useResult
  $Res call({String password, String phone, String firebaseJwt});
}

/// @nodoc
class _$ResetPasswordWithPhoneCopyWithImpl<$Res,
        $Val extends ResetPasswordWithPhone>
    implements $ResetPasswordWithPhoneCopyWith<$Res> {
  _$ResetPasswordWithPhoneCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = null,
    Object? phone = null,
    Object? firebaseJwt = null,
  }) {
    return _then(_value.copyWith(
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      firebaseJwt: null == firebaseJwt
          ? _value.firebaseJwt
          : firebaseJwt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResetPasswordWithPhoneImplCopyWith<$Res>
    implements $ResetPasswordWithPhoneCopyWith<$Res> {
  factory _$$ResetPasswordWithPhoneImplCopyWith(
          _$ResetPasswordWithPhoneImpl value,
          $Res Function(_$ResetPasswordWithPhoneImpl) then) =
      __$$ResetPasswordWithPhoneImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String password, String phone, String firebaseJwt});
}

/// @nodoc
class __$$ResetPasswordWithPhoneImplCopyWithImpl<$Res>
    extends _$ResetPasswordWithPhoneCopyWithImpl<$Res,
        _$ResetPasswordWithPhoneImpl>
    implements _$$ResetPasswordWithPhoneImplCopyWith<$Res> {
  __$$ResetPasswordWithPhoneImplCopyWithImpl(
      _$ResetPasswordWithPhoneImpl _value,
      $Res Function(_$ResetPasswordWithPhoneImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = null,
    Object? phone = null,
    Object? firebaseJwt = null,
  }) {
    return _then(_$ResetPasswordWithPhoneImpl(
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      firebaseJwt: null == firebaseJwt
          ? _value.firebaseJwt
          : firebaseJwt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResetPasswordWithPhoneImpl implements _ResetPasswordWithPhone {
  const _$ResetPasswordWithPhoneImpl(
      {required this.password, required this.phone, required this.firebaseJwt});

  factory _$ResetPasswordWithPhoneImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResetPasswordWithPhoneImplFromJson(json);

  @override
  final String password;
  @override
  final String phone;
  @override
  final String firebaseJwt;

  @override
  String toString() {
    return 'ResetPasswordWithPhone(password: $password, phone: $phone, firebaseJwt: $firebaseJwt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetPasswordWithPhoneImpl &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.firebaseJwt, firebaseJwt) ||
                other.firebaseJwt == firebaseJwt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, password, phone, firebaseJwt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetPasswordWithPhoneImplCopyWith<_$ResetPasswordWithPhoneImpl>
      get copyWith => __$$ResetPasswordWithPhoneImplCopyWithImpl<
          _$ResetPasswordWithPhoneImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResetPasswordWithPhoneImplToJson(
      this,
    );
  }
}

abstract class _ResetPasswordWithPhone implements ResetPasswordWithPhone {
  const factory _ResetPasswordWithPhone(
      {required final String password,
      required final String phone,
      required final String firebaseJwt}) = _$ResetPasswordWithPhoneImpl;

  factory _ResetPasswordWithPhone.fromJson(Map<String, dynamic> json) =
      _$ResetPasswordWithPhoneImpl.fromJson;

  @override
  String get password;
  @override
  String get phone;
  @override
  String get firebaseJwt;
  @override
  @JsonKey(ignore: true)
  _$$ResetPasswordWithPhoneImplCopyWith<_$ResetPasswordWithPhoneImpl>
      get copyWith => throw _privateConstructorUsedError;
}
