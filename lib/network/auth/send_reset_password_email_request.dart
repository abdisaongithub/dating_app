import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_reset_password_email_request.freezed.dart';
part 'send_reset_password_email_request.g.dart';

@freezed
class SendResetPasswordEmailRequest with _$SendResetPasswordEmailRequest {
  const factory SendResetPasswordEmailRequest({
    required String email,
  }) = _SendResetPasswordEmailRequest;
  factory SendResetPasswordEmailRequest.fromJson(Map<String, dynamic> json) =>
      _$SendResetPasswordEmailRequestFromJson(json);
}
