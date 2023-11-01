import 'package:dating_app/common/widgets/big_text.dart';
import 'package:dating_app/features/auth/sign_up_with_email_screen.dart';
import 'package:dating_app/features/auth/sign_up_with_phone_screen.dart';
import 'package:flutter/material.dart';

import 'sign_in_screen.dart';

class SignUpOrSignInScreen extends StatefulWidget {
  static String id = 'SignUpScreen';

  const SignUpOrSignInScreen({Key? key}) : super(key: key);

  @override
  _SignUpOrSignInScreenState createState() => _SignUpOrSignInScreenState();
}

class _SignUpOrSignInScreenState extends State<SignUpOrSignInScreen> {
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
                fontSize: 46,
              ),
              const SizedBox(height: 10),
              const BigText(
                text: 'or Sign in',
                orangeBackground: false,
                fontSize: 46,
              ),
              const Expanded(child: SizedBox(height: 20)),
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, SignUpWithPhoneScreen.id);
                },
                child: Center(
                  child: Container(
                    // width: 160,
                    height: 50,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(66, 66, 66, 1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(
                      child: Text(
                        'Continue with Phone',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, SignUpWithEmailScreen.id);
                },
                child: Center(
                  child: Container(
                    // width: 160,
                    height: 50,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(66, 66, 66, 1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(
                      child: Text(
                        'Sign up with Email',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: InkWell(
                  onTap: () {
                    // Navigator.pushNamed(context, SignInScreen.id);
                  },
                  child: const Text(
                    'Have an account? Sign In instead',
                    style: TextStyle(color: Color.fromRGBO(3, 191, 217, 1)),
                  ),
                ),
              ),
              const Expanded(child: SizedBox(height: 20)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.6,
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
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, SignInScreen.id);
                    },
                    child: Container(
                      // width: 160,
                      height: 50,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(0, 0, 0, 0.8),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Center(
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
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

class OtpCodeInputField extends StatelessWidget {
  const OtpCodeInputField({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      padding: const EdgeInsets.symmetric(
        horizontal: 2,
        vertical: 0,
      ),
      decoration: const BoxDecoration(
          // color: Color.fromRGBO(195, 195, 195, 0.27),
          // borderRadius: BorderRadius.circular(20),
          ),
      child: Center(
        child: TextFormField(
          controller: emailController,
          decoration: const InputDecoration(
            // border: InputBorder.,
            counter: null,
            counterText: "",
          ),
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18,
          ),
          maxLength: 1,
          // maxLengthEnforcement: MaxLengthEnforcement.enforced,
          keyboardType: TextInputType.number,
        ),
      ),
    );
  }
}
