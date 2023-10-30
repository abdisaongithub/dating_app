import 'package:dio/dio.dart';

import '../util/credentials.dart';

class DioHelper {
  static Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://${Credentials.baseUrl}/',
      receiveDataWhenStatusError: true,
    ),
  );

  static Future<Response> setData({
    required String path,
    Map<String, dynamic>? query,
    required data,
    String? auth,
    bool image = false,
  }) async {
    dio.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };

    return await dio.post(
      path,
      data: data,
      queryParameters: query,
    );
  }
}
