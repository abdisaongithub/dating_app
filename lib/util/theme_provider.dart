import 'package:flutter/material.dart';


class CustomTheme {
  static final lightTheme = ThemeData(
    // primaryColorLight: CustomColor.redo,
    // primaryColorDark: CustomColor.redo,
    highlightColor: Colors.red,
    colorScheme: ColorScheme.fromSwatch(
      accentColor: Colors.red,
    ),
    scrollbarTheme: ScrollbarThemeData(
      interactive: true,
      radius: const Radius.circular(10.0),
      thumbColor: MaterialStateProperty.all(
        Colors.red,
      ),
      thickness: MaterialStateProperty.all(5.0),
      minThumbLength: 100,

    ),
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.red,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.red,
      selectionColor: Colors.red,
      selectionHandleColor: Colors.red,
    ),
    // splashColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      titleSpacing: -5,
      iconTheme: IconThemeData(
        color: Color.fromRGBO(120, 120, 120, 1),
      ),
      backgroundColor: Colors.white,
      centerTitle: false,
      elevation: 0,
      toolbarTextStyle: TextStyle(
        color: Colors.red,
        fontSize: 15,
        fontWeight: FontWeight.w700,
      ),
      titleTextStyle: TextStyle(
        color: Colors.red,
        fontSize: 15,
        fontWeight: FontWeight.w700,
      ),
    ),
    fontFamily: 'Montserrat',
    iconTheme: const IconThemeData(
      color: Color.fromRGBO(120, 120, 120, 1),
    ),
  );
}
