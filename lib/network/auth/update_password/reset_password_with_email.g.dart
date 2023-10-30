// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_with_email.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResetPasswordWithEmailImpl _$$ResetPasswordWithEmailImplFromJson(
        Map<String, dynamic> json) =>
    _$ResetPasswordWithEmailImpl(
      email: json['email'] as String,
      emailOtp: json['emailOtp'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$$ResetPasswordWithEmailImplToJson(
        _$ResetPasswordWithEmailImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'emailOtp': instance.emailOtp,
      'password': instance.password,
    };
