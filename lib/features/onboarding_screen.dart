import 'package:dating_app/features/auth/sign_up_or_sign_in_screen.dart';
import 'package:flutter/material.dart';

import '../common/widgets/big_text.dart';

class OnboardingScreen extends StatefulWidget {
  static String id = 'OnboardingScreen';

  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool over18 = false;

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
              const BigText(text: 'Find a person',),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                width: MediaQuery.sizeOf(context).width,
                decoration: const BoxDecoration(
                    // color: Color(0xFFFB6009),
                    // borderRadius: BorderRadius.circular(20),
                    ),
                child: const Text(
                  'that matches\nyour vibe',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  setState(() {
                    over18 = !over18;
                  });
                },
                child: AnimatedContainer(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 8,
                  ),
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    color: over18 ? const Color(0xFF0A7B00) : const Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  duration: const Duration(
                    milliseconds: 300,
                  ),
                  child: Center(
                    child: Text(
                      "I'm over 18 years old",
                      style: TextStyle(
                        fontSize: 26,
                        color: over18 ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: AnimatedContainer(
                  width: 2,
                  height: 80,
                  decoration: BoxDecoration(
                    color: over18 ? const Color(0xFF0A7B00) : const Color(0xFFD9D9D9),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  duration: const Duration(
                    milliseconds: 300,
                  ),
                ),
              ),
              Center(
                child: AnimatedContainer(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    color: over18 ? const Color(0xFF0A7B00) : const Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  duration: const Duration(
                    milliseconds: 300,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: InkWell(
                  onTap: () {
                    if (over18) {
                      Navigator.pushNamed(context, SignUpOrSignInScreen.id);
                      debugPrint('Go to next page');
                    }
                  },
                  child: AnimatedContainer(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 8,
                    ),
                    // width: MediaQuery.sizeOf(context).width,
                    width: 120,
                    decoration: BoxDecoration(
                      color: over18 ? Colors.black : const Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    duration: const Duration(
                      milliseconds: 300,
                    ),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Get\nStarted",
                          style: TextStyle(
                            fontSize: 16,
                            color: over18 ? Colors.white : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

