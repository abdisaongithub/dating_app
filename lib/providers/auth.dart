// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workmanager/workmanager.dart';

import '../common/models/user.dart';
import '../constants/endpoints.dart';
import '../network/auth/update_password/update_password.dart';
import '../network/client.dart';
import '../network/core/core.dart';
import '../network/dio_helper.dart';
import '../util/apis.dart';
import '../util/credentials.dart';

void callbackDispatcher() {
  Workmanager().executeTask((taskName, inputData) async {
    bool res = await Auth.refreshToken();
    // debugPrint(res.toString());
    return Future.value(true);
  });
}

class Auth with ChangeNotifier {
  //! user Auth
  final dio = Dio();
  static String? accessToken;
  UserData _user = UserData();

  bool get isAuth {
    return accessToken != null;
  }

  String? get token {
    return accessToken;
  }

  UserData get user {
    return _user;
  }

  Future<void> sendFcmToken() async {
    FirebaseMessaging.instance.getToken().then((fcmToken) async {
      if (kDebugMode) {
        print('FCMToken: $fcmToken');
      }
      var url = Uri.https(Credentials.baseUrl, APIs.fcmToken);
      try {
        await http.patch(
          url,
          body: json.encode({"FcmToken": fcmToken, 'AdminFcmToken': null}),
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json",
            "access-token": "Bearer $accessToken",
          },
        );
      } catch (err) {
        rethrow;
      }
    });
  }

  static Future<bool> refreshToken() async {
    //  if(Auth.accessToken!=null){
    final prefs = await SharedPreferences.getInstance();
    try {
      final path = AuthEndpoint.refreshToken;
      String? refreshToken = prefs.getString('refreshToken');
      String? phone = prefs.getString('phone');
      Response response = await DioHelper.setData(
        path: path,
        data: {
          'refreshToken': refreshToken,
          'phone': phone,
        },
      );
      //print('------ data ----- \n' + response.data.toString());
      debugPrint(response.data.toString());
      accessToken = response.data['data']['accessToken'];
      // debugPrint(accessToken);
      // if((GetIt.I.isRegistered<ApiClient>(instance: ApiClient)))
      //   {
      //
      //    Fluttertoast.showToast(msg: 'registered');
      //     final apiClient = ApiClientImpl(Dio());
      //     GetIt.I.registerSingleton<ApiClient>(apiClient);

      //   }
      // final apiClient = ApiClientImpl(Dio());
      // GetIt.I.registerSingleton<ApiClient>(apiClient);
      // GetIt.I<ApiClient>().authToken = response.data['AccessToken'];
      await prefs.setString('token', response.data['data']['accessToken']);
      await prefs.setString(
          'refreshToken', response.data['data']['refreshToken']);
      // debugPrint('----------- refreshing token Done ----------');
      return true;
    } catch (e) {
      // Fluttertoast.showToast(msg: e.toString());
      // debugPrint(e.toString());
      // debugPrint('----------- refreshing token Not Done ----------');
      // debugPrint('----------- ${e.toString()} ----------');
      return false;
    }
    // }else {
    //   Fluttertoast.showToast(msg: accessToken.toString() + ' ' + GetIt.I<ApiClient>().authToken.toString() );
    //   return false;
    // }
  }

  Future<Map<String, dynamic>> loginWithEmail(
      String email, String password) async {
    final body = {
      'email': email,
      'password': password,
    };

    return await _login(body);
  }

  Future<Map<String, dynamic>> loginWithPhone(
      String phone, String password) async {
    // debugPrint("password $password".toString());
    final body = {
      'phone': phone,
      'password': password,
    };

    return await _login(body);
  }

  /// POSTS a Login request to backend
  Future<Map<String, dynamic>> _login(Map<String, dynamic> body) async {
    var url = Uri.https(Credentials.baseUrl, 'v1/${APIs.login}');

    try {
      final response = await http.post(
        url,
        body: json.encode(body),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
      );
      final responseData = json.decode(response.body) as Map<String, dynamic>;

      if (response.statusCode >= 400) {
        print("respone ${response.body}");
        return responseData;
      }
      debugPrint(responseData.toString());
      accessToken = responseData['data']['accessToken'];
      GetIt.I<ApiClient>().authToken = accessToken;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', responseData['data']['accessToken']);

      await prefs.setString(
          'refreshToken', responseData['data']['refreshToken']);
      Workmanager().initialize(callbackDispatcher, isInDebugMode: false);
      Workmanager().registerPeriodicTask('1', 'Refresh Token',
          frequency: const Duration(minutes: 15));
      //
      await sendFcmToken();
      await getProfile();
      refreshToken();
      return {
        'message': 'Done',
      };
    } catch (err) {
      rethrow;
    }
  }

  Future<String> signup(
      {required String idToken,
      required String firstName,
      required String lastName,
      required String phone,
      required String password,
      required String email,
      required String confirmPassword,
      required String gender,
      required String birthday}) async {
    var url = Uri.https(Credentials.baseUrl, '/v1/${APIs.signup}');
    final pref = await SharedPreferences.getInstance();
    // final language = pref.getString('language') ?? 'EN';
    String language = 'EN';
    debugPrint('phone: $email'.toString());
    Map<String, String> data;

    data = {
      'idToken': idToken,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'language': language,
      'phone': phone,
      'password': password,
      'confirmPassword': password,
      'gender': gender,
      'birthday': birthday,
    };

    try {
      var request = http.MultipartRequest('POST', url)..fields.addAll(data);
      var response = await request.send();
      final respStr = await response.stream.bytesToString();
      var encoded = json.decode(respStr);
      debugPrint('Registration response $encoded'.toString());

      if (encoded['success'] == false) {
        return encoded['message'];
      }
      accessToken = encoded['data']['accessToken'];
      GetIt.I<ApiClient>().authToken = accessToken;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', encoded['data']['accessToken']);

      await prefs.setString('refreshToken', encoded['data']['refreshToken']);
      Workmanager().initialize(callbackDispatcher, isInDebugMode: false);
      Workmanager().registerPeriodicTask('1', 'Refresh Token',
          frequency: const Duration(minutes: 15));
      // //
      await sendFcmToken();
      await getProfile();
      refreshToken();
      notifyListeners();
      return 'Done Successfully';
    } catch (err) {
      return 'Error has occurred';
    }
  }

  Future<String> resetPasswordUsingEmail({required String email}) async {
    var url = Uri.https(
        Credentials.baseUrl, '/v1/${APIs.resetPasswordUsingEmail}/$email');
    debugPrint(url.toString());
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'email': email,
          },
        ),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
      );
      final responseData = json.decode(response.body) as Map<String, dynamic>;
      debugPrint(responseData.toString());
      if (responseData['success'] == false) {
        return responseData['error'][0]['msg'];
      }
      debugPrint(response.body.toString());
      notifyListeners();
      return "Done";
    } catch (err) {
      debugPrint(err.toString());
      return 'Error occurred please try again';
    }
  }

  Future<String> resetPasswordUsingPhone({required String phone}) async {
    var url = Uri.https(
        Credentials.baseUrl, '/v1/${APIs.resetPasswordUsingPhone}/$phone');
    debugPrint(url.toString());
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'phone': phone,
          },
        ),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
      );
      final responseData = json.decode(response.body) as Map<String, dynamic>;

      if (responseData['success'] == false) {
        // debugPrint(responseData.toString());
        return responseData['message'];
      }
      debugPrint(response.body.toString());
      notifyListeners();
      return "Done";
    } catch (err) {
      debugPrint(err.toString());
      return 'Error occurred please try again';
    }
  }

  Future<String> resetPasswordVerifyCodeUsingPhone({
    required String phone,
    required String idToken,
  }) async {
    var url = Uri.https(
        Credentials.baseUrl, '/v1/${APIs.resetPasswordVerifyCode}/$phone');
    debugPrint(url.toString());
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'idToken': idToken,
          },
        ),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
      );
      debugPrint(response.body.toString());
      final responseData = json.decode(response.body) as Map<String, dynamic>;
      if (responseData['success'] == false) {
        return responseData['error'][0]['msg'];
      }
      debugPrint(response.body.toString());
      notifyListeners();
      return "Done";
    } catch (err) {
      debugPrint(err.toString());
      return 'Error occurred please try again';
    }
  }

  Future<String> registerPhone({required String phone}) async {
    var url = Uri.https(Credentials.baseUrl, '/v1/${APIs.registerPhone}');
    debugPrint(url.toString());
    debugPrint(phone.toString());
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'phone': phone,
          },
        ),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
      );
      final responseData = json.decode(response.body) as Map<String, dynamic>;
      if (responseData['success'] == false) {
        debugPrint("error ${response.body}".toString());
        return responseData['data']['msg'];
      }
      debugPrint(response.body.toString());
      notifyListeners();
      return "Done";
    } catch (err) {
      debugPrint(err.toString());
      debugPrint(err.toString());
      return 'Error occurred please try again';
    }
  }

  Future<String> changePhone({required String phone}) async {
    var url = Uri.https(Credentials.baseUrl, '/v1/${APIs.changePhone}');
    debugPrint(url.toString());
    try {
      final response = await http.put(
        url,
        body: json.encode(
          {
            'phone': phone,
          },
        ),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "access-token": "$accessToken",
        },
      );
      final responseData = json.decode(response.body) as Map<String, dynamic>;
      // print("response data ${responseData}");
      if (responseData['success'] == false) {
        return responseData['message'];
      }
      debugPrint(response.body.toString());
      notifyListeners();
      return "Done";
    } catch (err) {
      debugPrint(err.toString());
      return 'Error occurred please try again';
    }
  }

  Future<String> verifyChangePhone({
    required String phone,
    required String idToken,
  }) async {
    var url = Uri.https(Credentials.baseUrl, '/v1/${APIs.verifyChangePhone}');
    debugPrint(url.toString());
    try {
      final response = await http.put(
        url,
        body: json.encode(
          {
            'idToken': idToken,
            'phone': phone,
          },
        ),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "access-token": "$accessToken",
        },
      );
      debugPrint(response.body.toString());
      final responseData = json.decode(response.body) as Map<String, dynamic>;
      if (responseData['success'] == false) {
        return responseData['error'][0]['msg'];
      }
      debugPrint(response.body.toString());
      notifyListeners();
      return "Done";
    } catch (err) {
      debugPrint(err.toString());
      return 'Error occurred please try again';
    }
  }

  // Future<String> changePasswordUsingEmail({
  //   required String email,
  //   required String newPassword,
  //   required String confirmPassword,
  // }) async {
  //   var url = Uri.https(
  //       Credentials.baseUrl, '/v1/${APIs.changePasswordUsingEmail}/$email');
  //   debugPrint(url.toString());
  //   try {
  //     final response = await http.put(
  //       url,
  //       body: json.encode(
  //         {
  //           'newPassword': newPassword,
  //           'confirmPassword': confirmPassword,
  //         },
  //       ),
  //       headers: {
  //         "Accept": "application/json",
  //         "Content-Type": "application/json",
  //         "access-token": "$accessToken",
  //       },
  //     );
  //     debugPrint(response.body.toString());
  //     final responseData = json.decode(response.body) as Map<String, dynamic>;
  //     if (responseData['success'] == false) {
  //       debugPrint(responseData.toString());
  //       return responseData['error'][0]['msg'];
  //     }
  //     debugPrint(response.body.toString());
  //     notifyListeners();
  //     return "Done";
  //   } catch (err) {
  //     debugPrint(err.toString());
  //     return 'Error occurred please try again';
  //   }
  // }
  //
  // Future<String> changePasswordUsingPhone(
  //     {required String phone,
  //     required String newPassword,
  //     required String confirmPassword}) async {
  //   var url = Uri.https(
  //       Credentials.baseUrl, 'v1/${APIs.changePasswordUsingPhone}/$phone');
  //   debugPrint(url.toString());
  //   try {
  //     final response = await http.put(
  //       url,
  //       body: json.encode(
  //         {
  //           'newPassword': newPassword,
  //           'confirmPassword': confirmPassword,
  //         },
  //       ),
  //       headers: {
  //         "Accept": "application/json",
  //         "Content-Type": "application/json",
  //       },
  //     );
  //     debugPrint(response.body.toString());
  //     final responseData = json.decode(response.body) as Map<String, dynamic>;
  //     debugPrint(response.statusCode.toString());
  //     if (responseData['success'] == false) {
  //       return responseData['error'][0]['msg'];
  //     }
  //     debugPrint(response.body.toString());
  //     notifyListeners();
  //     return "Done";
  //   } catch (err) {
  //     debugPrint(err.toString());
  //     return 'Error occurred please try again';
  //   }
  // }

  Future<String> sendVerificationCodeEmail() async {
    var url = Uri.https(
        Credentials.baseUrl, '/v1/${APIs.sendVerificationCodeForEmail}');
    debugPrint(url.toString());
    try {
      final response = await http.post(
        url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "access-token": "$accessToken",
        },
      );
      final responseData = json.decode(response.body) as Map<String, dynamic>;
      debugPrint(responseData.toString());
      if (responseData['success'] == false) {
        return responseData['error'][0]['msg'];
      }
      debugPrint(response.body.toString());
      notifyListeners();
      return "Done";
    } catch (err) {
      debugPrint(err.toString());
      return 'Error occurred please try again';
    }
  }

  ///Registration Email Verification
  Future<String> sendVerificationCodeEmailForRegistration(
      {required String email}) async {
    var url = Uri.https(Credentials.baseUrl,
        '/v1/${APIs.sendVerificationCodeBeforeRegistration}/$email');
    debugPrint(url.toString());
    try {
      final response = await http.post(
        url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
      );
      final responseData = json.decode(response.body) as Map<String, dynamic>;
      debugPrint(responseData.toString());
      if (responseData['success'] == false) {
        return responseData['data'][0]['msg'];
      }
      debugPrint(response.body.toString());
      notifyListeners();
      return "Done";
    } catch (err) {
      debugPrint(err.toString());
      return 'Error occurred please try again';
    }
  }

  Future<String> verificationCodeEmailForRegistration(
      {required String email, required String code}) async {
    var url = Uri.https(
        Credentials.baseUrl, '/v1/${APIs.verifyCodeBeforeRegistration}/$email');
    // debugPrint(url.toString());
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'code': code,
        }),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
      );
      print("resonse ${response.body}");
      final responseData = json.decode(response.body) as Map<String, dynamic>;

      if (responseData['success'] == false) {
        return responseData['message'];
      }
      debugPrint(response.body.toString());
      notifyListeners();
      return "Done";
    } catch (err) {
      debugPrint(err.toString());
      return 'Error occurred please try again';
    }
  }

  Future<String> verifyResetPasswordEmailCode(
      {required String email, required String code}) async {
    var url = Uri.https(
        Credentials.baseUrl, '/v1/${APIs.verifyResetPasswordEmailCode}/$email');
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'code': code,
        }),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
      );
      debugPrint(response.body.toString());
      final responseData = json.decode(response.body) as Map<String, dynamic>;
      debugPrint(responseData.toString());
      if (responseData['success'] == false) {
        return responseData['error'][0]['msg'];
      }
      debugPrint(response.body.toString());
      notifyListeners();
      return "Done";
    } catch (err) {
      debugPrint(err.toString());
      return 'Error occurred please try again';
    }
  }

  Future<String> verifyEmail({required String code}) async {
    var url = Uri.https(Credentials.baseUrl, '/v1/${APIs.verifyEmailByCode}');
    debugPrint(url.toString());
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'code': code,
        }),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
      );
      final responseData = json.decode(response.body) as Map<String, dynamic>;
      debugPrint(responseData.toString());
      if (responseData['success'] == false) {
        return responseData['error'][0]['msg'];
      }
      debugPrint(response.body.toString());
      notifyListeners();
      return "Done";
    } catch (err) {
      debugPrint(err.toString());
      return 'Error occurred please try again';
    }
  }

  Future<void> getProfile() async {
    var url = Uri.https(Credentials.baseUrl, '/v1/${APIs.getProfile}');
    try {
      final response = await http.get(
        url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "access-token": "$accessToken",
        },
      );
      if (response.statusCode >= 400) {
        debugPrint('here clear data'.toString());
        await logout();
        return;
      }
      debugPrint(response.body.toString());
      final responseData = json.decode(response.body);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('phone', responseData['data']['phone']);
      _user = UserData(
          id: responseData['data']['id'],
          firstName: responseData['data']['firstName'],
          lastName: responseData['data']['lastName'],
          email: responseData['data']['email'],
          phone: responseData['data']['phone'],
          status: responseData['data']['status'],
          isEmailVerified: responseData['data']['isEmailVerified'],
          isPhoneVerified: responseData['data']['isPhoneVerified'],
          adminChatNotification: responseData['data']['adminChatNotification'],
          chatNotification: responseData['data']['chatNotification'],
          orderNotification: responseData['data']['orderNotification'],
          tederaNotification: responseData['data']['tederaNotification']);
      // print(_user.chatNotification);
      notifyListeners();
    } catch (err) {
      rethrow;
    }
  }

  Future<bool> updateProfile({
    required String firstName,
    required String lastName,
  }) async {
    var url = Uri.https(Credentials.baseUrl, 'v1/${APIs.updateProfile}');
    debugPrint(url.toString());
    debugPrint(firstName.toString());
    debugPrint(lastName.toString());
    try {
      final response = await http.put(
        url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "access-token": "$accessToken",
        },
        body: json.encode(
          {
            "firstName": firstName,
            "lastName": lastName,
          },
        ),
      );
      if (response.statusCode >= 400) {
        debugPrint(response.body.toString());
        return false;
      }
      debugPrint(response.body.toString());
      await getProfile();
      return true;
    } catch (err) {
      rethrow;
    }
  }

  Future<bool> forgetPassword(String email) async {
    var url = Uri.https(Credentials.baseUrl, APIs.forgotPassword(email));
    try {
      final response = await http.post(
        url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
      );
      final responseData = json.decode(response.body);
      return responseData['Updated'] == true;
    } catch (err) {
      rethrow;
    }
  }

  Future<bool> changeEmail({
    required String email,
    required String password,
  }) async {
    var url = Uri.https(Credentials.baseUrl, APIs.changeEmail);
    try {
      final response = await http.patch(
        url,
        body: json.encode(
          {
            "NewEmail": email.trim(),
            "Password": password.trim(),
          },
        ),
        headers: {
          //"Accept": "application/json",
          "Content-Type": "application/json",
          "Authorization": "Bearer $accessToken",
        },
      );
      if (response.statusCode >= 400) {
        debugPrint(response.body);
        return false;
      }
      return true;
    } catch (err) {
      rethrow;
    }
  }

  //delete an account using password as required field
  Future<bool> deleteAccount({required String password}) async {
    var url = Uri.https(Credentials.baseUrl, 'v1/${APIs.deleteAccount}');
    try {
      final response = await http.delete(
        url,
        body: json.encode(
          {
            "password": password.trim(),
            "confirmPassword": password.trim(),
          },
        ),
        headers: {
          //"Accept": "application/json",
          "Content-Type": "application/json",
          "access-token": "$accessToken",
        },
      );
      debugPrint(response.body.toString());
      if (response.statusCode >= 400) {
        return false;
      }
      return true;
    } catch (err) {
      rethrow;
    }
  }

  /// Used when changing password (NOT reset password)
  Future<bool> updatePassword({
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    var url = Uri.https(Credentials.baseUrl, '/v1/${APIs.changePwd}');
    debugPrint(url.toString());
    try {
      final response = await http.put(
        url,
        body: json.encode(
          {
            "oldPassword": oldPassword,
            "newPassword": newPassword,
            "confirmPassword": confirmPassword,
          },
        ),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "access-token": "$accessToken",
        },
      );
      if (response.statusCode >= 400) {
        return false;
      }
      return true;
    } catch (err) {
      rethrow;
    }
  }

  Future<String?> resetPasswordWithPhone({
    required String password,
    required String phone,
    required String jwt,
  }) async {
    final req = ResetPasswordWithPhone(
      password: password,
      phone: phone,
      firebaseJwt: jwt,
    );

    final apiResult = await GetIt.I<ApiClient>().resetPasswordWithPhone(req);

    return await apiResult.when(success: (success) {
      return null;
    }, failure: (err) {
      return err.maybeWhen(
        unauthorizedRequest: (err) {
          return err;
        },
        orElse: () => null,
      );
    });
  }

  Future<String?> resetPasswordWithEmail({
    required String password,
    required String email,
    required String emailOtp,
  }) async {
    final req = ResetPasswordWithEmail(
      password: password,
      email: email,
      emailOtp: emailOtp,
    );

    final apiResult = await GetIt.I<ApiClient>().resetPasswordWithEmail(req);

    return await apiResult.when(success: (success) {
      return null;
    }, failure: (err) {
      return err.maybeWhen(
        unauthorizedRequest: (err) {
          return err;
        },
        orElse: () {
          return NetworkExceptions.getErrorMessage(err);
        },
      );
    });
  }

  Future<bool> verifyPhone(
    String jwt,
    String phone,
    bool isNewPhone,
    String code,
  ) async {
    var url = Uri.https(
      Credentials.baseUrl,
      '/v1/${APIs.verifyPhone}',
    );
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            // "FirebaseJwt": jwt.trim(),
            // "NewPhone": phone.trim(),
            'code': code,
          },
        ),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $accessToken",
        },
      );
      // debugPrint('hello baby');
      if (response.statusCode >= 400) {
        debugPrint(response.body);
        return false;
      }
      return true;
    } catch (err) {
      debugPrint(err.toString());
      rethrow;
    }
  }

  Future<bool> tryAutoLogin() async {
    await Workmanager().cancelAll();

    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('token')) {
      return false;
    }
    await refreshToken();
    if (!prefs.containsKey('token')) {
      return false;
    }
    Workmanager().initialize(callbackDispatcher, isInDebugMode: false);
    Workmanager().registerPeriodicTask('1', 'Refresh Token',
        frequency: const Duration(minutes: 15));
    final token = prefs.getString('token');
    accessToken = token;
    GetIt.I<ApiClient>().authToken = accessToken;
    //refreshToken();
    await getProfile();
    return true;
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    final url = Uri.https(
      Credentials.baseUrl,
      '/v1/${APIs.logout}',
    );
    try {
      await http.delete(
        url,
        headers: {
          "Content-Type": "application/json",
          "access-token": "$accessToken",
        },
      );
      accessToken = null;
      await Workmanager().cancelAll();
      GetIt.I<ApiClient>().authToken = null;
      _user = UserData();

      notifyListeners();

      await logoutFB();
    } catch (err) {
      debugPrint(err.toString());
      rethrow;
    }
  }

  Future<void> logoutFB() async {
    FirebaseAuth.instance.signOut();
  }

  Future<void> enableDisableOrderNotification({
    required String status,
  }) async {
    var url = Uri.https(
      Credentials.baseUrl,
      APIs.changeOrderNotification,
      {
        "Status": [status],
      },
    );
    try {
      final response = await http.patch(
        url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "Authorization": "Bearer $accessToken",
        },
      );
      getProfile();
      notifyListeners();
      debugPrint('Store push notification status was updated ${response.body}');
    } catch (err) {
      debugPrint('err: $err');
      rethrow;
    }
  }

  Future<void> enableDisableTederaNotification({
    required String status,
  }) async {
    var url = Uri.https(
      Credentials.baseUrl,
      APIs.changeTederaNotification,
      {
        "Status": [status],
      },
    );
    try {
      final response = await http.patch(
        url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "Authorization": "Bearer $accessToken",
        },
      );
      debugPrint('Store push notification status was updated ${response.body}');
      getProfile();
      notifyListeners();
    } catch (err) {
      debugPrint('err: $err');
      rethrow;
    }
  }

  Future<void> enableDisableChatNotification({
    required String status,
  }) async {
    var url = Uri.https(
      Credentials.baseUrl,
      APIs.changeChatNotification,
      {
        "Status": [status],
      },
    );
    try {
      final response = await http.patch(
        url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "Authorization": "Bearer $accessToken",
        },
      );
      debugPrint('Store push notification status was updated ${response.body}');
      getProfile();

      notifyListeners();
    } catch (err) {
      debugPrint('err: $err');
      rethrow;
    }
  }
}
