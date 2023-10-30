// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'send_reset_password_email_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SendResetPasswordEmailRequest _$SendResetPasswordEmailRequestFromJson(
    Map<String, dynamic> json) {
  return _SendResetPasswordEmailRequest.fromJson(json);
}

/// @nodoc
mixin _$SendResetPasswordEmailRequest {
  String get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SendResetPasswordEmailRequestCopyWith<SendResetPasswordEmailRequest>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendResetPasswordEmailRequestCopyWith<$Res> {
  factory $SendResetPasswordEmailRequestCopyWith(
          SendResetPasswordEmailRequest value,
          $Res Function(SendResetPasswordEmailRequest) then) =
      _$SendResetPasswordEmailRequestCopyWithImpl<$Res,
          SendResetPasswordEmailRequest>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class _$SendResetPasswordEmailRequestCopyWithImpl<$Res,
        $Val extends SendResetPasswordEmailRequest>
    implements $SendResetPasswordEmailRequestCopyWith<$Res> {
  _$SendResetPasswordEmailRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SendResetPasswordEmailRequestImplCopyWith<$Res>
    implements $SendResetPasswordEmailRequestCopyWith<$Res> {
  factory _$$SendResetPasswordEmailRequestImplCopyWith(
          _$SendResetPasswordEmailRequestImpl value,
          $Res Function(_$SendResetPasswordEmailRequestImpl) then) =
      __$$SendResetPasswordEmailRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$SendResetPasswordEmailRequestImplCopyWithImpl<$Res>
    extends _$SendResetPasswordEmailRequestCopyWithImpl<$Res,
        _$SendResetPasswordEmailRequestImpl>
    implements _$$SendResetPasswordEmailRequestImplCopyWith<$Res> {
  __$$SendResetPasswordEmailRequestImplCopyWithImpl(
      _$SendResetPasswordEmailRequestImpl _value,
      $Res Function(_$SendResetPasswordEmailRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$SendResetPasswordEmailRequestImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SendResetPasswordEmailRequestImpl
    implements _SendResetPasswordEmailRequest {
  const _$SendResetPasswordEmailRequestImpl({required this.email});

  factory _$SendResetPasswordEmailRequestImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$SendResetPasswordEmailRequestImplFromJson(json);

  @override
  final String email;

  @override
  String toString() {
    return 'SendResetPasswordEmailRequest(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendResetPasswordEmailRequestImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendResetPasswordEmailRequestImplCopyWith<
          _$SendResetPasswordEmailRequestImpl>
      get copyWith => __$$SendResetPasswordEmailRequestImplCopyWithImpl<
          _$SendResetPasswordEmailRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SendResetPasswordEmailRequestImplToJson(
      this,
    );
  }
}

abstract class _SendResetPasswordEmailRequest
    implements SendResetPasswordEmailRequest {
  const factory _SendResetPasswordEmailRequest({required final String email}) =
      _$SendResetPasswordEmailRequestImpl;

  factory _SendResetPasswordEmailRequest.fromJson(Map<String, dynamic> json) =
      _$SendResetPasswordEmailRequestImpl.fromJson;

  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$SendResetPasswordEmailRequestImplCopyWith<
          _$SendResetPasswordEmailRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
