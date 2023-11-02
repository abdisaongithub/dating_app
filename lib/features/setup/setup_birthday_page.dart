import 'package:dating_app/features/setup/setup_screen.dart';
import 'package:flutter/material.dart';

import '../../common/widgets/big_text.dart';
import '../../constants/image_paths.dart';

class SetupBirthdayPage extends StatefulWidget {
  static String id = 'SetupBirthdayPage';

  const SetupBirthdayPage({Key? key}) : super(key: key);

  @override
  _SetupBirthdayPageState createState() => _SetupBirthdayPageState();
}

class _SetupBirthdayPageState extends State<SetupBirthdayPage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      child: Stack(
        children: [
          SafeArea(
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                height: MediaQuery.sizeOf(context).width,
                width: MediaQuery.sizeOf(context).width * 0.5,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(251, 96, 9, 0.24),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10000),
                    bottomLeft: Radius.circular(10000),
                  ),
                ),
              ),
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Image(
                image: const AssetImage(
                  PngPaths.art1,
                ),
                width: MediaQuery.sizeOf(context).width * 0.5,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: MediaQuery.sizeOf(context).width * 0.25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BigText(
                      text: 'Birthday',
                      orangeBackground: false,
                      width: MediaQuery.sizeOf(context).width * 0.7,
                      fontSize: 50,
                    ),
                    const Image(
                      image: AssetImage(PngPaths.user),
                      width: 44,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text('What is your birthday'),
                const SizedBox(height: 10),
                Container(
                  height: 2,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(195, 195, 195, 0.27),
                          // borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          controller: firstNameController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Month',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(195, 195, 195, 0.27),
                          // borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          controller: firstNameController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Date',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(195, 195, 195, 0.27),
                          // borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          controller: firstNameController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Year',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  height: 2,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 60),
                const Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        '20',
                        style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Year old',
                        style: TextStyle(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        // Navigator.pushNamed(context, LandingScreen.id);

                        pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.bounceIn,
                        );
                      },
                      child: Container(
                        width: 160,
                        height: 50,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(0, 0, 0, 0.8),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Center(
                          child: Text(
                            'Previous',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // Navigator.pushNamed(context, LandingScreen.id);

                        pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.bounceIn,
                        );
                      },
                      child: Container(
                        width: 160,
                        height: 50,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(0, 0, 0, 0.8),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Center(
                          child: Text(
                            'Next',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
