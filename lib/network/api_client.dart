import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'auth/update_password/update_password.dart';
import 'auth/verify_phone_request.dart';
import 'core/api_result.dart';

abstract class ApiClient {
  final Dio _dio;
  String? _authToken;

  // ignore: unnecessary_getters_setters
  String? get authToken => _authToken;

  Dio get dio => _dio;

  bool get isAuthenticated => _authToken != null;

  // ignore: unnecessary_getters_setters
  set authToken(String? token) {
    // debugPrint('Setting ApiClient token: $token');
    _authToken = token;
  }

  ApiClient(this._dio) {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        if (_authToken != null) {
          options.headers['access-token'] = '$_authToken';
        }
        options.headers['Content-Type'] = 'application/json';
        options.headers['Accept'] = 'application/json';

        options.followRedirects = false;
        options.validateStatus = (status) => true;
        final body = options.data;

        if (body != null) {
          // debugPrint('Request Body:');
          _printRequestBody(body);
        }

        return handler.next(options);
      },
    ));
  }

  // Auth
  Future<ApiResult<String>> verifyEmail({required String email});

  Future<ApiResult<bool>> addEmail();

  Future<ApiResult<String>> sendResetPasswordEmail({required String email});

  Future<ApiResult<String>> verifyResetCodeEmail({
    required String code,
    required String email,
  });

  Future<ApiResult<String>> changeEmail({required String newEmail});

  Future<ApiResult<String>> verifyChangeEmail(
      {required String newEmail, required String code});

  // Future<ApiResult<bool>> verifyResetPasswordPhone(
  //     VerifyResetPasswordPhoneRequest request);

  Future<ApiResult<bool>> updatePassword(UpdatePasswordRequest request);

  Future<ApiResult<bool>> resetPasswordWithEmail(
      ResetPasswordWithEmail request);

  Future<ApiResult<bool>> resetPasswordWithPhone(
      ResetPasswordWithPhone request);

  Future<ApiResult<String>> changePasswordUsingEmail({
    required String email,
    required String newPassword,
    required String confirmPassword,
  });

  Future<ApiResult<String>> changePasswordUsingPhone({
    required String phone,
    required String newPassword,
    required String confirmPassword,
  });

  /// pass [newPhone] as true if changing phone number
  Future<ApiResult<bool>> verifyPhone(
    VerifyPhoneRequest request,
    bool newPhone,
  );

  // Addresses


  Future<ApiResult<bool>> markNotificationAsRead(String notificationId);

  Future<ApiResult<int>> getNotificationCount();

  void _printRequestBody(msg) {
    msg.toString().split('\n').forEach(debugPrint);
  }
}
