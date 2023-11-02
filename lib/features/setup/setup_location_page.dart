import 'package:dating_app/common/widgets/big_text.dart';
import 'package:flutter/material.dart';

import '../../constants/image_paths.dart';
import 'setup_screen.dart';

class SetupLocationPage extends StatefulWidget {
  static String id = 'SetupLocationPage';

  const SetupLocationPage({Key? key}) : super(key: key);

  @override
  _SetupLocationPageState createState() => _SetupLocationPageState();
}

class _SetupLocationPageState extends State<SetupLocationPage> {
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
              alignment: Alignment.topLeft,
              child: Image(
                image: const AssetImage(
                  PngPaths.pin,
                ),
                width: MediaQuery.sizeOf(context).width * 0.55,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: MediaQuery.sizeOf(context).width * 0.4),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  BigText(
                    text: 'Location',
                    fontSize: 42,
                    width: MediaQuery.sizeOf(context).width / 2,
                    orangeBackground: false,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const SizedBox(width: 20,),
                  const Text('Where do you live?'),
                ],
              ),
              const SizedBox(height: 10),
              Center(
                child: Image.asset(
                  PngPaths.map,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}
