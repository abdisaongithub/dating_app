import 'package:dating_app/constants/image_paths.dart';
import 'package:dating_app/features/setup/setup_birthday_page.dart';
import 'package:dating_app/features/setup/setup_gender_page.dart';
import 'package:dating_app/features/setup/setup_height_page.dart';
import 'package:dating_app/features/setup/setup_location_page.dart';
import 'package:dating_app/features/setup/setup_name_page.dart';
import 'package:flutter/material.dart';

import 'setup_ethnicity_page.dart';
import 'setup_kids_page.dart';

class SetupScreen extends StatefulWidget {
  static String id = 'SetupScreen';

  const SetupScreen({Key? key}) : super(key: key);

  @override
  _SetupScreenState createState() => _SetupScreenState();
}

PageController pageController = PageController(
  initialPage: 0,
  keepPage: true,
);

class _SetupScreenState extends State<SetupScreen> {
  List<Widget> pages = [
    const SetupNamePage(),
    const SetupBirthdayPage(),
    const SetupLocationPage(),
    const SetupGenderPage(),
    const SetupHeightPage(),
    const SetupEthnicityPage(),
    const SetupKidsPage(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: pages,
      ),
    );
  }
}
