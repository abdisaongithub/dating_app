import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_reset_password_phone_request.freezed.dart';
part 'verify_reset_password_phone_request.g.dart';

@freezed
class VerifyResetPasswordPhoneRequest with _$VerifyResetPasswordPhoneRequest {
  const factory VerifyResetPasswordPhoneRequest({
    required String phone,
    required String firebaseJwt,
  }) = _VerifyResetPasswordPhoneRequest;
  factory VerifyResetPasswordPhoneRequest.fromJson(Map<String, dynamic> json) =>
      _$VerifyResetPasswordPhoneRequestFromJson(json);
}
