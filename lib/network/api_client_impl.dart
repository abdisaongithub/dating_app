import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../constants/endpoints.dart';
import '../util/apis.dart';
import '../util/credentials.dart';
import 'api_client.dart';
import 'auth/update_password/reset_password_with_email.dart';
import 'auth/update_password/reset_password_with_phone.dart';
import 'auth/update_password/update_password_request.dart';
import 'auth/verify_phone_request.dart';
import 'core/core.dart';

class ApiClientImpl extends ApiClient {
  ApiClientImpl(Dio dio) : super(dio);

  @override
  Future<ApiResult<String>> verifyEmail({required String email}) async {
    try {
      final url = AuthEndpoint.changeEmail;

      debugPrint('Sending code on email');
      debugPrint(url.toString());
      // Ignore result from 200
      final response = await dio.put(
        url,
        data: json.encode(
          {
            'email': email,
          },
        ),
      );

      if (response.data['success'] == false) {
        return ApiResult.success(
          data: response.data['data'][0]['msg'],
        );
      }
      return const ApiResult.success(data: 'Otp sent successfully');
    } on DioError catch (e) {
      debugPrint(e.response.toString());
      return ApiResult.failure(error: NetworkExceptions.fromError(e));
    }
  }

  @override
  Future<ApiResult<String>> verifyChangeEmail(
      {required String newEmail, required String code}) async {
    try {
      final url = AuthEndpoint.verifyChangeEmail;

      debugPrint('Sending code on email');
      debugPrint(url.toString());
      // Ignore result from 200
      await dio.put(
        url,
        data: json.encode({
          'code': code,
          'email': newEmail,
        }),
      );

      return const ApiResult.success(data: 'Done');
    } on DioError catch (e) {
      debugPrint(e.response.toString());
      return ApiResult.failure(error: NetworkExceptions.fromError(e));
    }
  }

  @override
  Future<ApiResult<bool>> addEmail() async {
    try {
      final url = AuthEndpoint.changeEmail;

      debugPrint('Sending code on email');
      debugPrint(url.toString());
      // Ignore result from 200
      await dio.post(url);

      return const ApiResult.success(data: true);
    } on DioError catch (e) {
      debugPrint(e.response!.data['data']!.toString());
      return ApiResult.failure(error: NetworkExceptions.fromError(e));
    }
  }

  @override
  Future<ApiResult<String>> sendResetPasswordEmail(
      {required String email}) async {
    try {
      final url = AuthEndpoint.sendResetPasswordEmail;

      debugPrint('Sending reset password email');
      debugPrint(url.toString());
      // Ignore result from 200
      final response = await dio.post('$url/$email');

      if (response.data['success'] == false) {
        return ApiResult.success(
          data: response.data['data'][0]['msg'],
        );
      }

      return const ApiResult.success(data: 'Otp sent successfully');
    } on DioError catch (e) {
      debugPrint(e.response.toString());
      return ApiResult.failure(error: NetworkExceptions.fromError(e));
    }
  }

  @override
  Future<ApiResult<String>> verifyResetCodeEmail({
    required String code,
    required String email,
  }) async {
    try {
      final url = '${AuthEndpoint.verifyResetCodeEmail}/$email';

      debugPrint('Verifying Reset Password for email:');
      debugPrint(url.toString());
      // Ignore result from 200
      debugPrint("Code $code".toString());
      final response = await dio.post(
        url,
        data: json.encode({
          'code': code,
        }),
      );
      if (response.data['success'] == false) {
        return ApiResult.success(
          data: response.data['data'][0]['msg'],
        );
      }
      return const ApiResult.success(data: 'Done');
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.fromError(e));
    }
  }

  // @override
  // Future<ApiResult<bool>> verifyResetPasswordPhone(
  //     VerifyResetPasswordPhoneRequest request) async {
  //   try {
  //     final url = AuthEndpoint.verifyResetPasswordEmail;
  //
  //     debugPrint(
  //         'Verifying Reset Password for phone: ${request.phone}, ${request.firebaseJwt}');
  //
  //     // Ignore result from 200
  //     await dio.post(url, data: request.toJson());
  //
  //     return const ApiResult.success(data: true);
  //   } catch (e) {
  //     return ApiResult.failure(error: NetworkExceptions.fromError(e));
  //   }
  // }

  @override
  Future<ApiResult<bool>> resetPasswordWithEmail(
      ResetPasswordWithEmail request) async {
    try {
      final url = AuthEndpoint.updatePassword;

      debugPrint('resetting password with $request');

      // Ignore result from 200
      await dio.patch(url, data: request.toJson());

      return const ApiResult.success(data: true);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.fromError(e));
    }
  }

  @override
  Future<ApiResult<bool>> resetPasswordWithPhone(
      ResetPasswordWithPhone request) async {
    try {
      final url = AuthEndpoint.updatePassword;

      debugPrint('resetting password with $request');

      // Ignore result from 200
      await dio.patch(url, data: request.toJson());

      return const ApiResult.success(data: true);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.fromError(e));
    }
  }

  @override
  Future<ApiResult<bool>> updatePassword(UpdatePasswordRequest request) async {
    try {
      final url = AuthEndpoint.updatePassword;

      debugPrint('update password: $request');

      // Ignore result from 200
      await dio.patch(
        url,
        data: request.toJson(),
      );

      return const ApiResult.success(data: true);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.fromError(e));
    }
  }

  @override
  Future<ApiResult<String>> changePasswordUsingPhone({
    required String phone,
    required String newPassword,
    required String confirmPassword,
  }) async {
    final url = '${AuthEndpoint.changePasswordUsingPhone}/$phone';
    try {
      await dio.put(
        url,
        data: json.encode(
          {
            'newPassword': newPassword,
            'confirmPassword': confirmPassword,
          },
        ),
      );

      return const ApiResult.success(data: "Done");
    } catch (err) {
      return ApiResult.failure(
          error: NetworkExceptions.fromError('try again something went wrong'));
    }
  }

  @override
  Future<ApiResult<String>> changePasswordUsingEmail({
    required String email,
    required String newPassword,
    required String confirmPassword,
  }) async {
    final url = '${AuthEndpoint.changePasswordUsingEmail}/$email';

    try {
      final response = await dio.put(url,
          data: json.encode(
            {
              'newPassword': newPassword,
              'confirmPassword': confirmPassword,
            },
          ));
      // debugPrint(response.data.toString());
      Map responseData = response.data;
      if (responseData['success'] == false) {
        return ApiResult.failure(
            error: NetworkExceptions.fromError(responseData['message']));
      }
      return const ApiResult.success(data: "Done");
    } catch (err) {
      // debugPrint(err.toString());
      return ApiResult.failure(
          error: NetworkExceptions.fromError(err.toString()));
    }
  }

  @override
  Future<ApiResult<String>> changeEmail({required String newEmail}) async {
    try {
      final url = AuthEndpoint.changeEmail;

      debugPrint('change email: $url');

      // Ignore result from 200
      final response = await dio.put(
        url,
        data: json.encode({
          'email': newEmail,
        }),
      );
      debugPrint(response.statusCode.toString());
      debugPrint(response.data.toString());
      if (response.data['success'] == false) {
        final String message = response.data['data'][0]['msg'];
        return ApiResult.success(data: message);
      }
      return const ApiResult.success(data: "Done");
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.fromError(e));
    }
  }

  @override
  Future<ApiResult<bool>> verifyPhone(
    VerifyPhoneRequest request,
    bool newPhone,
  ) async {
    try {
      final url = !newPhone
          ? AuthEndpoint.verifyPhone
          : '${AuthEndpoint.verifyPhone}?newPhone=$newPhone';

      debugPrint('Verifying phone $request, newPhone: $newPhone');

      await dio.post(url, data: request.toJson());

      return const ApiResult.success(data: true);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.fromError(e));
    }
  }

  @override
  Future<ApiResult<int>> getNotificationCount() {
    // TODO: implement getNotificationCount
    throw UnimplementedError();
  }

  @override
  Future<ApiResult<bool>> markNotificationAsRead(String notificationId) {
    // TODO: implement markNotificationAsRead
    throw UnimplementedError();
  }


}
