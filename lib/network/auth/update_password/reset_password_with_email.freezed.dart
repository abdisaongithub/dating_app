// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reset_password_with_email.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ResetPasswordWithEmail _$ResetPasswordWithEmailFromJson(
    Map<String, dynamic> json) {
  return _ResetPasswordWithEmail.fromJson(json);
}

/// @nodoc
mixin _$ResetPasswordWithEmail {
  String get email => throw _privateConstructorUsedError;
  String get emailOtp => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResetPasswordWithEmailCopyWith<ResetPasswordWithEmail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetPasswordWithEmailCopyWith<$Res> {
  factory $ResetPasswordWithEmailCopyWith(ResetPasswordWithEmail value,
          $Res Function(ResetPasswordWithEmail) then) =
      _$ResetPasswordWithEmailCopyWithImpl<$Res, ResetPasswordWithEmail>;
  @useResult
  $Res call({String email, String emailOtp, String password});
}

/// @nodoc
class _$ResetPasswordWithEmailCopyWithImpl<$Res,
        $Val extends ResetPasswordWithEmail>
    implements $ResetPasswordWithEmailCopyWith<$Res> {
  _$ResetPasswordWithEmailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? emailOtp = null,
    Object? password = null,
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
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResetPasswordWithEmailImplCopyWith<$Res>
    implements $ResetPasswordWithEmailCopyWith<$Res> {
  factory _$$ResetPasswordWithEmailImplCopyWith(
          _$ResetPasswordWithEmailImpl value,
          $Res Function(_$ResetPasswordWithEmailImpl) then) =
      __$$ResetPasswordWithEmailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String emailOtp, String password});
}

/// @nodoc
class __$$ResetPasswordWithEmailImplCopyWithImpl<$Res>
    extends _$ResetPasswordWithEmailCopyWithImpl<$Res,
        _$ResetPasswordWithEmailImpl>
    implements _$$ResetPasswordWithEmailImplCopyWith<$Res> {
  __$$ResetPasswordWithEmailImplCopyWithImpl(
      _$ResetPasswordWithEmailImpl _value,
      $Res Function(_$ResetPasswordWithEmailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? emailOtp = null,
    Object? password = null,
  }) {
    return _then(_$ResetPasswordWithEmailImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      emailOtp: null == emailOtp
          ? _value.emailOtp
          : emailOtp // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResetPasswordWithEmailImpl implements _ResetPasswordWithEmail {
  const _$ResetPasswordWithEmailImpl(
      {required this.email, required this.emailOtp, required this.password});

  factory _$ResetPasswordWithEmailImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResetPasswordWithEmailImplFromJson(json);

  @override
  final String email;
  @override
  final String emailOtp;
  @override
  final String password;

  @override
  String toString() {
    return 'ResetPasswordWithEmail(email: $email, emailOtp: $emailOtp, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetPasswordWithEmailImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.emailOtp, emailOtp) ||
                other.emailOtp == emailOtp) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email, emailOtp, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetPasswordWithEmailImplCopyWith<_$ResetPasswordWithEmailImpl>
      get copyWith => __$$ResetPasswordWithEmailImplCopyWithImpl<
          _$ResetPasswordWithEmailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResetPasswordWithEmailImplToJson(
      this,
    );
  }
}

abstract class _ResetPasswordWithEmail implements ResetPasswordWithEmail {
  const factory _ResetPasswordWithEmail(
      {required final String email,
      required final String emailOtp,
      required final String password}) = _$ResetPasswordWithEmailImpl;

  factory _ResetPasswordWithEmail.fromJson(Map<String, dynamic> json) =
      _$ResetPasswordWithEmailImpl.fromJson;

  @override
  String get email;
  @override
  String get emailOtp;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$ResetPasswordWithEmailImplCopyWith<_$ResetPasswordWithEmailImpl>
      get copyWith => throw _privateConstructorUsedError;
}
