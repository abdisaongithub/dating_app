import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';
import 'constants/prefs_keys.dart';
import 'network/client.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await dotenv.load(fileName: ".env");

  _setupApiClient();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  final prefs = await SharedPreferences.getInstance();
  final localeStr = prefs.getString(kPrefsAppLocale);
  final showHome = prefs.getBool('showHome') ?? false;
  Locale locale = Locale(localeStr ?? 'en');

  runApp(
    MyApp(
      appLocale: locale,
      prefs: prefs,
      showHome: showHome,
    ),
  );
}

void _setupApiClient() {
  final apiClient = ApiClientImpl(Dio());
  GetIt.I.registerSingleton<ApiClient>(apiClient);

  // final storeApiClient = StoreApiClientImpl(Dio());
  // GetIt.I.registerSingleton<StoreApiClient>(storeApiClient);
}
