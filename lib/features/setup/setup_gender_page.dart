import 'package:dating_app/constants/image_paths.dart';
import 'package:flutter/material.dart';

import '../../common/widgets/big_text.dart';
import 'setup_screen.dart';

class SetupGenderPage extends StatefulWidget {
  static String id = 'SetupGenderPage';

  const SetupGenderPage({Key? key}) : super(key: key);

  @override
  _SetupGenderPageState createState() => _SetupGenderPageState();
}

class _SetupGenderPageState extends State<SetupGenderPage> {
  bool male = true;
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
                  text: 'Gender',
                  orangeBackground: false,
                  fontSize: 40,
                  width: MediaQuery.sizeOf(context).width * 0.5,
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
              'Where do you live?',
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        male = true;
                      });
                      // Navigator.pushNamed(context, LandingScreen.id);
                      // pageController.animateToPage(
                      //   1,
                      //   duration: const Duration(milliseconds: 300),
                      //   curve: Curves.bounceIn,
                      // );
                    },
                    child: AnimatedContainer(
                      width: 250,
                      height: 50,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: male ? const Color.fromRGBO(0, 0, 0, 0.8) : const Color.fromRGBO(222, 222, 222, 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      duration: const Duration(milliseconds: 300),
                      child: Center(
                        child: Text(
                          'Male',
                          style: TextStyle(
                            color: male ? Colors.white : Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      setState(() {
                        male = false;
                      });
                      // Navigator.pushNamed(context, LandingScreen.id);
                      // pageController.animateToPage(
                      //   3,
                      //   duration: const Duration(milliseconds: 300),
                      //   curve: Curves.bounceIn,
                      // );
                    },
                    child: AnimatedContainer(
                      width: 250,
                      height: 50,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: !male ? const Color.fromRGBO(0, 0, 0, 0.8) : const Color.fromRGBO(222, 222, 222, 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      duration: const Duration(milliseconds: 300),
                      child: Center(
                        child: Text(
                          'Female',
                          style: TextStyle(
                            color: male ? Colors.black : Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
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
      ),
    );
  }
}
