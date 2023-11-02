import 'package:flutter/material.dart';

import '../../common/widgets/big_text.dart';
import '../setup/setup_screen.dart';

class LandingScreen extends StatefulWidget {
  static String id = 'LandingScreen';

  const LandingScreen({Key? key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Container(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey.shade400,
                    radius: 20,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 30,
                    width: 250,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade500,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                height: 150,
                // margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.grey.shade500,
                  // borderRadius: BorderRadius.circular(20),
                ),
              ),
              const SizedBox(height: 20),
              const BigText(
                text: 'it\'s not',
                orangeBackground: false,
              ),
              const SizedBox(height: 10),
              const BigText(
                text: 'just a',
                orangeBackground: false,
              ),
              const SizedBox(height: 10),
              const BigText(
                text: 'Dating app',
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.55,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            margin: const EdgeInsets.only(
                              top: 11,
                            ),
                            height: 2,
                            // width: MediaQuery.sizeOf(context).width * 0.3,
                            decoration: const BoxDecoration(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        // Align(
                        //   alignment: Alignment.centerRight,
                        //   child: Container(
                        //     margin: const EdgeInsets.only(left: 20),
                        //     child: const Icon(
                        //       Icons.arrow_right_alt,
                        //       color: Colors.black,
                        //       size: 24,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10,),
                  InkWell(
                    onTap: () {
                        Navigator.pushNamed(context, SetupScreen.id);
                    },
                    child: AnimatedContainer(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 8,
                      ),
                      // width: MediaQuery.sizeOf(context).width,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      duration: const Duration(
                        milliseconds: 300,
                      ),
                      child: const Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Get\nStarted",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const Expanded(child: SizedBox(height: 20)),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey.shade500,
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
