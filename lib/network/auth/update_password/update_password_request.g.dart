// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_password_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdatePasswordRequestImpl _$$UpdatePasswordRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdatePasswordRequestImpl(
      password: json['password'] as String,
      oldPassword: json['oldPassword'] as String,
    );

Map<String, dynamic> _$$UpdatePasswordRequestImplToJson(
        _$UpdatePasswordRequestImpl instance) =>
    <String, dynamic>{
      'password': instance.password,
      'oldPassword': instance.oldPassword,
    };
