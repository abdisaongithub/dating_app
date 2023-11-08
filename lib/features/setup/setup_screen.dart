import 'package:dating_app/constants/image_paths.dart';
import 'package:dating_app/features/setup/setup_alcohol_page.dart';
import 'package:dating_app/features/setup/setup_birthday_page.dart';
import 'package:dating_app/features/setup/setup_clubbing_page.dart';
import 'package:dating_app/features/setup/setup_education_page.dart';
import 'package:dating_app/features/setup/setup_gender_page.dart';
import 'package:dating_app/features/setup/setup_gym_page.dart';
import 'package:dating_app/features/setup/setup_height_page.dart';
import 'package:dating_app/features/setup/setup_location_page.dart';
import 'package:dating_app/features/setup/setup_movies_page.dart';
import 'package:dating_app/features/setup/setup_name_page.dart';
import 'package:dating_app/features/setup/setup_other_sports_page.dart';
import 'package:dating_app/features/setup/setup_partying_page.dart';
import 'package:dating_app/features/setup/setup_politics_page.dart';
import 'package:dating_app/features/setup/setup_religion_page.dart';
import 'package:dating_app/features/setup/setup_smoking_page.dart';
import 'package:dating_app/features/setup/setup_weed_page.dart';
import 'package:dating_app/features/setup/setup_vape_page.dart';
import 'package:flutter/material.dart';

import 'setup_ethnicity_page.dart';
import 'setup_family_plan.dart';
import 'setup_hometown_page.dart';
import 'setup_job_page.dart';
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
    const SetupFamilyPlanPage(),
    const SetupHometownPage(),
    const SetupJobPage(),
    const SetupEducationPage(),
    const SetupReligionPage(),
    const SetupPoliticsPage(),
    const SetupAlcoholPage(),
    const SetupSmokingPage(),
    const SetupWeedPage(),
    const SetupVapePage(),
    const SetupClubbingPage(),
    const SetupPartyingPage(),
    const SetupGymPage(),
    const SetupOtherSportsPage(),
    const SetupMoviesPage(),
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
