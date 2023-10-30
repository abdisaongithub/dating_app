import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constants/prefs_keys.dart';

class LanguageCubit extends Cubit<Locale> {
  final SharedPreferences _prefs;

  LanguageCubit(Locale initialLocale, this._prefs) : super(initialLocale);

  void changeLocale(String localeStr) async {
    await _prefs.setString(kPrefsAppLocale, localeStr);
    emit(Locale(localeStr));
  }
}
