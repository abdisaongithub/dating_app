// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_with_phone.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResetPasswordWithPhoneImpl _$$ResetPasswordWithPhoneImplFromJson(
        Map<String, dynamic> json) =>
    _$ResetPasswordWithPhoneImpl(
      password: json['password'] as String,
      phone: json['phone'] as String,
      firebaseJwt: json['firebaseJwt'] as String,
    );

Map<String, dynamic> _$$ResetPasswordWithPhoneImplToJson(
        _$ResetPasswordWithPhoneImpl instance) =>
    <String, dynamic>{
      'password': instance.password,
      'phone': instance.phone,
      'firebaseJwt': instance.firebaseJwt,
    };
