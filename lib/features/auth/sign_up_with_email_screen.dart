import 'package:dating_app/common/widgets/big_text.dart';
import 'package:flutter/material.dart';

import 'sign_up_or_sign_in_screen.dart';

class SignUpWithEmailScreen extends StatefulWidget {
  static String id = 'SignUpWithEmailScreen';

  const SignUpWithEmailScreen({Key? key}) : super(key: key);

  @override
  _SignUpWithEmailScreenState createState() => _SignUpWithEmailScreenState();
}

class _SignUpWithEmailScreenState extends State<SignUpWithEmailScreen> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              const BigText(
                text: 'Sign up',
                orangeBackground: false,
                fontSize: 46,
              ),
              const SizedBox(height: 10),
              const BigText(
                text: 'with your email',
                fontSize: 46,
              ),
              const SizedBox(height: 20),
              const Text('Enter your email'),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(195, 195, 195, 0.27),
                  // borderRadius: BorderRadius.circular(20),
                ),
                child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: Container(
                  width: 160,
                  height: 50,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(0, 0, 0, 0.8),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      'Send Code',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              const Expanded(child: SizedBox(height: 20)),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 4, left: 6, right: 6),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        OtpCodeInputField(emailController: emailController),
                        const SizedBox(
                          width: 4,
                        ),
                        OtpCodeInputField(emailController: emailController),
                        const SizedBox(
                          width: 4,
                        ),
                        OtpCodeInputField(emailController: emailController),
                        const SizedBox(
                          width: 4,
                        ),
                        OtpCodeInputField(emailController: emailController),
                        const SizedBox(
                          width: 4,
                        ),
                        OtpCodeInputField(emailController: emailController),
                        const SizedBox(
                          width: 4,
                        ),
                        OtpCodeInputField(emailController: emailController),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    // width: 160,
                    height: 50,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 0, 0, 0.8),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        'Continue',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}