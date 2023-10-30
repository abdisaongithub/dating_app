import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_reset_password_email_request.freezed.dart';
part 'verify_reset_password_email_request.g.dart';

@freezed
class VerifyResetPasswordEmailRequest with _$VerifyResetPasswordEmailRequest {
  const factory VerifyResetPasswordEmailRequest({
    required String email,
    required String emailOtp,
  }) = _VerifyResetPasswordEmailRequest;
  factory VerifyResetPasswordEmailRequest.fromJson(Map<String, dynamic> json) =>
      _$VerifyResetPasswordEmailRequestFromJson(json);
}
