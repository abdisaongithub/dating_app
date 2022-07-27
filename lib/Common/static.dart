import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xff63A1E6);
const kSecondaryColor = Color(0xff42628c);
const kTextFieldTitle = Color(0xff020E1B);
const kTextFieldIcon = Color(0xffD6D6D6);
const kEndPoint = "https://yetale.memokeria.com";
const kSizedBoxH20 = SizedBox(height: 20);
const kSizedBoxH2 = SizedBox(height: 2);
const kSizedBoxH4 = SizedBox(height: 4);
const kSizedBoxH8 = SizedBox(height: 8);
const kSizedBoxH12 = SizedBox(height: 12);
const kSizedBoxH16 = SizedBox(height: 16);
const kSizedBoxW = SizedBox(width: 20);
const kSizedBoxW2 = SizedBox(width: 2);
const kSizedBoxW4 = SizedBox(width: 4);
final kDashedLine = Container(
  height: 4,
  width: 30,
  color: kPrimaryColor,
);
const TextStyle kTextStyle = TextStyle(
  fontSize: 40,
  fontWeight: FontWeight.bold,
  letterSpacing: 2,
);

const kScaffoldColor = Color(0xffF8FBFF);
const kDarkColor = Color(0xff000029);
final kHomeScaffoldColor = const Color(0xffF6F8F9).withOpacity(1.0);
const kLight = 'light';
const kDark = 'dark';
const kTheme = 'theme';
final boxDecoration = BoxDecoration(
  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.1),
      offset: const Offset(0, 2.0),
      blurRadius: 2.0,
    ),
  ],
  color: Colors.white,
  borderRadius: BorderRadius.circular(20.0),
);
final kTextFieldOutline = OutlineInputBorder(
  borderRadius: BorderRadius.circular(20),
  borderSide: const BorderSide(
    color: Colors.white,
    width: 10,
  ),
);
