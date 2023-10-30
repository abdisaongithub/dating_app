// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_phone_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VerifyPhoneRequestImpl _$$VerifyPhoneRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$VerifyPhoneRequestImpl(
      firebaseJwt: json['firebaseJwt'] as String,
      newPhone: json['newPhone'] as String?,
    );

Map<String, dynamic> _$$VerifyPhoneRequestImplToJson(
        _$VerifyPhoneRequestImpl instance) =>
    <String, dynamic>{
      'firebaseJwt': instance.firebaseJwt,
      'newPhone': instance.newPhone,
    };
