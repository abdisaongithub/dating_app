import 'package:dating_app/constants/image_paths.dart';
import 'package:flutter/material.dart';

import '../../common/widgets/big_text.dart';
import 'setup_screen.dart';

class SetupEducationPage extends StatefulWidget {
  static String id = 'SetupEducationPage';

  const SetupEducationPage({Key? key}) : super(key: key);

  @override
  _SetupEducationPageState createState() => _SetupEducationPageState();
}

class _SetupEducationPageState extends State<SetupEducationPage> {
  List<List<dynamic>> education = [
    ['None', true],
    ['Primary', false],
    ['High School', false],
    ['Diploma', false],
    ['Bachelors', false],
    ['MA', false],
    ['Doctorate', false],
    ['Professor', false],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                BigText(
                  text: 'Education',
                  orangeBackground: false,
                  fontSize: 40,
                  width: MediaQuery.sizeOf(context).width * 0.6,
                ),
                Image.asset(
                  PngPaths.userFill,
                  height: 60,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                for (var i = 0; i < 30; i++)
                  Container(
                    width: 5,
                    height: 5,
                    margin: const EdgeInsets.only(left: 5),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.2),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Highest you have finished?',
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'High School',
                    style: TextStyle(
                      color: Colors.grey.withOpacity(0.8),
                    ),
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  const RotatedBox(
                    quarterTurns: 1,
                    child: Icon(
                      Icons.chevron_right,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.sizeOf(context).width,
              width: MediaQuery.sizeOf(context).width,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: <Widget>[
                    for (var eth in education)
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(eth[0]),
                          const Expanded(
                            child: SizedBox(),
                          ),
                          Checkbox(
                            value: eth[1],
                            onChanged: (bool? change) {
                              setState(() {
                                // eth[1] = !eth
                              });
                            },
                            activeColor: Colors.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ],
                      )
                  ],
                ),
              ),
            ),
            const Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            const SizedBox(height: 20),
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
    );
  }
}
