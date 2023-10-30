// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_reset_password_phone_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VerifyResetPasswordPhoneRequest _$VerifyResetPasswordPhoneRequestFromJson(
    Map<String, dynamic> json) {
  return _VerifyResetPasswordPhoneRequest.fromJson(json);
}

/// @nodoc
mixin _$VerifyResetPasswordPhoneRequest {
  String get phone => throw _privateConstructorUsedError;
  String get firebaseJwt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VerifyResetPasswordPhoneRequestCopyWith<VerifyResetPasswordPhoneRequest>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyResetPasswordPhoneRequestCopyWith<$Res> {
  factory $VerifyResetPasswordPhoneRequestCopyWith(
          VerifyResetPasswordPhoneRequest value,
          $Res Function(VerifyResetPasswordPhoneRequest) then) =
      _$VerifyResetPasswordPhoneRequestCopyWithImpl<$Res,
          VerifyResetPasswordPhoneRequest>;
  @useResult
  $Res call({String phone, String firebaseJwt});
}

/// @nodoc
class _$VerifyResetPasswordPhoneRequestCopyWithImpl<$Res,
        $Val extends VerifyResetPasswordPhoneRequest>
    implements $VerifyResetPasswordPhoneRequestCopyWith<$Res> {
  _$VerifyResetPasswordPhoneRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = null,
    Object? firebaseJwt = null,
  }) {
    return _then(_value.copyWith(
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
abstract class _$$VerifyResetPasswordPhoneRequestImplCopyWith<$Res>
    implements $VerifyResetPasswordPhoneRequestCopyWith<$Res> {
  factory _$$VerifyResetPasswordPhoneRequestImplCopyWith(
          _$VerifyResetPasswordPhoneRequestImpl value,
          $Res Function(_$VerifyResetPasswordPhoneRequestImpl) then) =
      __$$VerifyResetPasswordPhoneRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String phone, String firebaseJwt});
}

/// @nodoc
class __$$VerifyResetPasswordPhoneRequestImplCopyWithImpl<$Res>
    extends _$VerifyResetPasswordPhoneRequestCopyWithImpl<$Res,
        _$VerifyResetPasswordPhoneRequestImpl>
    implements _$$VerifyResetPasswordPhoneRequestImplCopyWith<$Res> {
  __$$VerifyResetPasswordPhoneRequestImplCopyWithImpl(
      _$VerifyResetPasswordPhoneRequestImpl _value,
      $Res Function(_$VerifyResetPasswordPhoneRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = null,
    Object? firebaseJwt = null,
  }) {
    return _then(_$VerifyResetPasswordPhoneRequestImpl(
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
class _$VerifyResetPasswordPhoneRequestImpl
    implements _VerifyResetPasswordPhoneRequest {
  const _$VerifyResetPasswordPhoneRequestImpl(
      {required this.phone, required this.firebaseJwt});

  factory _$VerifyResetPasswordPhoneRequestImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$VerifyResetPasswordPhoneRequestImplFromJson(json);

  @override
  final String phone;
  @override
  final String firebaseJwt;

  @override
  String toString() {
    return 'VerifyResetPasswordPhoneRequest(phone: $phone, firebaseJwt: $firebaseJwt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyResetPasswordPhoneRequestImpl &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.firebaseJwt, firebaseJwt) ||
                other.firebaseJwt == firebaseJwt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, phone, firebaseJwt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyResetPasswordPhoneRequestImplCopyWith<
          _$VerifyResetPasswordPhoneRequestImpl>
      get copyWith => __$$VerifyResetPasswordPhoneRequestImplCopyWithImpl<
          _$VerifyResetPasswordPhoneRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerifyResetPasswordPhoneRequestImplToJson(
      this,
    );
  }
}

abstract class _VerifyResetPasswordPhoneRequest
    implements VerifyResetPasswordPhoneRequest {
  const factory _VerifyResetPasswordPhoneRequest(
          {required final String phone, required final String firebaseJwt}) =
      _$VerifyResetPasswordPhoneRequestImpl;

  factory _VerifyResetPasswordPhoneRequest.fromJson(Map<String, dynamic> json) =
      _$VerifyResetPasswordPhoneRequestImpl.fromJson;

  @override
  String get phone;
  @override
  String get firebaseJwt;
  @override
  @JsonKey(ignore: true)
  _$$VerifyResetPasswordPhoneRequestImplCopyWith<
          _$VerifyResetPasswordPhoneRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
