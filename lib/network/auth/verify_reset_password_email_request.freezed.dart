// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_reset_password_email_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VerifyResetPasswordEmailRequest _$VerifyResetPasswordEmailRequestFromJson(
    Map<String, dynamic> json) {
  return _VerifyResetPasswordEmailRequest.fromJson(json);
}

/// @nodoc
mixin _$VerifyResetPasswordEmailRequest {
  String get email => throw _privateConstructorUsedError;
  String get emailOtp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VerifyResetPasswordEmailRequestCopyWith<VerifyResetPasswordEmailRequest>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyResetPasswordEmailRequestCopyWith<$Res> {
  factory $VerifyResetPasswordEmailRequestCopyWith(
          VerifyResetPasswordEmailRequest value,
          $Res Function(VerifyResetPasswordEmailRequest) then) =
      _$VerifyResetPasswordEmailRequestCopyWithImpl<$Res,
          VerifyResetPasswordEmailRequest>;
  @useResult
  $Res call({String email, String emailOtp});
}

/// @nodoc
class _$VerifyResetPasswordEmailRequestCopyWithImpl<$Res,
        $Val extends VerifyResetPasswordEmailRequest>
    implements $VerifyResetPasswordEmailRequestCopyWith<$Res> {
  _$VerifyResetPasswordEmailRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? emailOtp = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      emailOtp: null == emailOtp
          ? _value.emailOtp
          : emailOtp // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerifyResetPasswordEmailRequestImplCopyWith<$Res>
    implements $VerifyResetPasswordEmailRequestCopyWith<$Res> {
  factory _$$VerifyResetPasswordEmailRequestImplCopyWith(
          _$VerifyResetPasswordEmailRequestImpl value,
          $Res Function(_$VerifyResetPasswordEmailRequestImpl) then) =
      __$$VerifyResetPasswordEmailRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String emailOtp});
}

/// @nodoc
class __$$VerifyResetPasswordEmailRequestImplCopyWithImpl<$Res>
    extends _$VerifyResetPasswordEmailRequestCopyWithImpl<$Res,
        _$VerifyResetPasswordEmailRequestImpl>
    implements _$$VerifyResetPasswordEmailRequestImplCopyWith<$Res> {
  __$$VerifyResetPasswordEmailRequestImplCopyWithImpl(
      _$VerifyResetPasswordEmailRequestImpl _value,
      $Res Function(_$VerifyResetPasswordEmailRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? emailOtp = null,
  }) {
    return _then(_$VerifyResetPasswordEmailRequestImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      emailOtp: null == emailOtp
          ? _value.emailOtp
          : emailOtp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VerifyResetPasswordEmailRequestImpl
    implements _VerifyResetPasswordEmailRequest {
  const _$VerifyResetPasswordEmailRequestImpl(
      {required this.email, required this.emailOtp});

  factory _$VerifyResetPasswordEmailRequestImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$VerifyResetPasswordEmailRequestImplFromJson(json);

  @override
  final String email;
  @override
  final String emailOtp;

  @override
  String toString() {
    return 'VerifyResetPasswordEmailRequest(email: $email, emailOtp: $emailOtp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyResetPasswordEmailRequestImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.emailOtp, emailOtp) ||
                other.emailOtp == emailOtp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email, emailOtp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyResetPasswordEmailRequestImplCopyWith<
          _$VerifyResetPasswordEmailRequestImpl>
      get copyWith => __$$VerifyResetPasswordEmailRequestImplCopyWithImpl<
          _$VerifyResetPasswordEmailRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerifyResetPasswordEmailRequestImplToJson(
      this,
    );
  }
}

abstract class _VerifyResetPasswordEmailRequest
    implements VerifyResetPasswordEmailRequest {
  const factory _VerifyResetPasswordEmailRequest(
      {required final String email,
      required final String emailOtp}) = _$VerifyResetPasswordEmailRequestImpl;

  factory _VerifyResetPasswordEmailRequest.fromJson(Map<String, dynamic> json) =
      _$VerifyResetPasswordEmailRequestImpl.fromJson;

  @override
  String get email;
  @override
  String get emailOtp;
  @override
  @JsonKey(ignore: true)
  _$$VerifyResetPasswordEmailRequestImplCopyWith<
          _$VerifyResetPasswordEmailRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
