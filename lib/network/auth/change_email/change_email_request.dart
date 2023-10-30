import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_email_request.freezed.dart';
part 'change_email_request.g.dart';

@freezed
class ChangeEmailRequest with _$ChangeEmailRequest {
  const factory ChangeEmailRequest({
    required String newEmail,
    required String password,
  }) = _ChangeEmailRequest;

  factory ChangeEmailRequest.fromJson(Map<String, dynamic> json) =>
      _$ChangeEmailRequestFromJson(json);
}
