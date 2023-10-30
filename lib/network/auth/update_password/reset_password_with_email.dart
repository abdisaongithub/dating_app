import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_with_email.freezed.dart';
part 'reset_password_with_email.g.dart';

@freezed
class ResetPasswordWithEmail with _$ResetPasswordWithEmail {
  const factory ResetPasswordWithEmail({
    required String email,
    required String emailOtp,
    required String password,
  }) = _ResetPasswordWithEmail;

  factory ResetPasswordWithEmail.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordWithEmailFromJson(json);
}
