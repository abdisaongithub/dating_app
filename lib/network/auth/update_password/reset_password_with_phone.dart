import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_with_phone.freezed.dart';
part 'reset_password_with_phone.g.dart';

@freezed
class ResetPasswordWithPhone with _$ResetPasswordWithPhone {
  const factory ResetPasswordWithPhone({
    required String password,
    required String phone,
    required String firebaseJwt,
  }) = _ResetPasswordWithPhone;

  factory ResetPasswordWithPhone.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordWithPhoneFromJson(json);
}
