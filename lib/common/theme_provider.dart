import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';

// THEME PROVIDERS

// THEMES
// light
final _lightTheme = ThemeData(
  colorScheme: const ColorScheme.light(),
  textTheme: GoogleFonts.montserratTextTheme(),
);

//dark
final _darkTheme = ThemeData.dark().copyWith(
  textTheme: GoogleFonts.montserratTextTheme().apply(
    bodyColor: Colors.white,
  ),
);

// EXTENSIONS AND CLASSES

class CustomThemeData {
  final double defaultPadding = 20.0;
  final double smallPadding = 10.0;
  final double largePadding = 30.0;

  final Color textColor;
  final Color bgColor;
  final Color appBarColor;
  final Color linkColor;
  final Color bgThemeColor;
  final Color btnColor;
  final Color pillColor;
  final Color searchAppBarColor;
  final Color chatContainerColor;

  final TextStyle textStyle;

  final Color shimmerBaseColor;
  final Color shimmerHighlightColor;

  final TextStyle boldTextStyle;
  final Color bottomNavigationBarColor;
  final Color primaryColor;
  final Color secondaryColor;
  final Color selectedColor;
  final Color unselectedColor;
  final Color scaffoldBackgroundColor;

  final LinearGradient gradientBackground;
  final LinearGradient setupBackground;
  CustomThemeData({
    this.textColor = Colors.black,
    required this.gradientBackground,
    required this.setupBackground,
    required this.bgColor,
    required this.textStyle,
    required this.appBarColor,
    required this.linkColor,
    required this.bgThemeColor,
    required this.btnColor,
    required this.pillColor,
    required this.searchAppBarColor,
    required this.chatContainerColor,
    required this.shimmerBaseColor,
    required this.shimmerHighlightColor,
    required this.boldTextStyle,
    required this.bottomNavigationBarColor,
    required this.primaryColor,
    required this.secondaryColor,
    required this.selectedColor,
    required this.unselectedColor,
    required this.scaffoldBackgroundColor,
  });
}

final _customLightTheme = CustomThemeData(
  textColor: Colors.black,
  bgColor: Colors.white,
  textStyle: const TextStyle(color: Colors.black),
  appBarColor: Colors.white,
  linkColor: Colors.blue,
  bgThemeColor: Colors.white,
  btnColor: const Color(0xFF9BECF6),
  pillColor: const Color(0xFFE5F5F7),
  searchAppBarColor: const Color(0xFF9497F3),
  chatContainerColor: const Color(0xFF30C270),
  shimmerBaseColor: Colors.grey.shade300,
  shimmerHighlightColor: Colors.grey.shade100,
  boldTextStyle: const TextStyle(
    fontSize: 19,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  ),
  bottomNavigationBarColor: Colors.white,
  primaryColor: Colors.amber,
  secondaryColor: Colors.yellow,
  selectedColor: const Color(0xff63A1E6),
  unselectedColor: Colors.black,
  scaffoldBackgroundColor: const Color(0xffF8FBFF),
  gradientBackground: const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color.fromRGBO(41, 171, 226, 0.6),
      Color.fromRGBO(154, 53, 251, 0),
    ],
  ),
  setupBackground: const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromRGBO(249, 119, 148, 1),
      Color.fromRGBO(98, 58, 162, 1),
    ],
  ),
);

final _customDarkTheme = CustomThemeData(
  textColor: Colors.white,
  bgColor: Colors.black26,
  textStyle: const TextStyle(color: Colors.white),
  appBarColor: Colors.black12,
  linkColor: Colors.blue,
  bgThemeColor: Colors.black,
  btnColor: const Color(0xFF9BECF6),
  pillColor: const Color(0xFFE5F5F7),
  searchAppBarColor: const Color(0xFFA8AAEF),
  chatContainerColor: const Color(0xFF30C270),
  shimmerBaseColor: Colors.grey.shade900,
  shimmerHighlightColor: Colors.grey.shade600,
  boldTextStyle: const TextStyle(
    fontSize: 19,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  ),
  bottomNavigationBarColor: Colors.green,
  primaryColor: Colors.amber,
  secondaryColor: Colors.yellow,
  selectedColor: const Color(0xff63A1E6),
  unselectedColor: Colors.white,
  scaffoldBackgroundColor: const Color(0xFF10101C),
  gradientBackground: const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromRGBO(41, 171, 226, 0.6),
      Color.fromRGBO(154, 53, 251, 0),
    ],
  ),
  setupBackground: const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color.fromRGBO(249, 119, 148, 1),
      Color.fromRGBO(98, 58, 162, 1),
    ],
  ),
);

extension CustomTheme on ThemeData {
  CustomThemeData get custom =>
      brightness == Brightness.dark ? _customDarkTheme : _customLightTheme;
}

// THEME PROVIDERS
// final lightThemeProvider = Provider((ref) => _lightTheme);
// final darkThemeProvider = Provider((ref) => _darkTheme);
//
// final themeModeProvider = StateProvider((ref) {
//   final theme = ref.watch(savedThemeProvider);
//   if (theme.value == kDark) {
//     return ThemeMode.dark;
//   } else {
//     return ThemeMode.light;
//   }
// });

// final savedThemeProvider = FutureProvider<String>((ref) async {
//   const storage = FlutterSecureStorage();
//   try {
//     final res = await storage.read(key: kTheme);
//     return res!;
//   } catch (e) {
//     await storage.write(key: kTheme, value: kLight);
//     return kLight;
//   }
// });
