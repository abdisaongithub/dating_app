import 'package:flutter/material.dart';

import '../../common/widgets/big_text.dart';
import 'sign_up_or_sign_in_screen.dart';

class SignUpWithPhoneScreen extends StatefulWidget {
  static String id = 'SignUpWithPhoneScreen';

  const SignUpWithPhoneScreen({Key? key}) : super(key: key);

  @override
  _SignUpWithPhoneScreenState createState() => _SignUpWithPhoneScreenState();
}

class _SignUpWithPhoneScreenState extends State<SignUpWithPhoneScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController textEditingController = TextEditingController();
  bool otpSent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
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
              const SizedBox(height: 50),
              const BigText(
                text: 'Sign up',
                fontSize: 46,
              ),
              const SizedBox(height: 10),
              const BigText(
                text: 'with your phone',
                orangeBackground: false,
                fontSize: 42,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    // width: 160,
                    height: 50,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(224, 224, 224, 1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(
                      child: Text(
                        '+251',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 26,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 4, left: 6, right: 6),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: Row(
                        // mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PhoneNumberInputField(textEditingController: textEditingController),
                          const SizedBox(
                            width: 4,
                          ),
                          PhoneNumberInputField(textEditingController: textEditingController),
                          const SizedBox(
                            width: 4,
                          ),
                          PhoneNumberInputField(textEditingController: textEditingController),
                          const SizedBox(
                            width: 4,
                          ),
                          PhoneNumberInputField(textEditingController: textEditingController),
                          const SizedBox(
                            width: 4,
                          ),
                          PhoneNumberInputField(textEditingController: textEditingController),
                          const SizedBox(
                            width: 4,
                          ),
                          PhoneNumberInputField(textEditingController: textEditingController),
                          const SizedBox(
                            width: 4,
                          ),
                          PhoneNumberInputField(textEditingController: textEditingController),
                          const SizedBox(
                            width: 4,
                          ),
                          PhoneNumberInputField(textEditingController: textEditingController),
                          const SizedBox(
                            width: 4,
                          ),
                          PhoneNumberInputField(textEditingController: textEditingController),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: (){
                      setState(() {
                        otpSent = !otpSent;
                      });
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
                          'Get Code',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BigText(
                    text: 'Send\nVerification\nCode',
                    fontSize: 38,
                    orangeBackground: false,
                    width: MediaQuery.sizeOf(context).width * 0.8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    // padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedContainer(
                          width: 2,
                          height: 80,
                          decoration: BoxDecoration(
                            color: otpSent ? Colors.black : const Color(0xFFD9D9D9),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          duration: const Duration(
                            milliseconds: 300,
                          ),
                        ),
                        AnimatedContainer(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                            color: otpSent ? Colors.black : const Color(0xFFD9D9D9),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          duration: const Duration(
                            milliseconds: 300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
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
                      color: const Color.fromRGBO(0, 0, 0, 0.8),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(
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

class PhoneNumberInputField extends StatelessWidget {
  const PhoneNumberInputField({
    super.key,
    required this.textEditingController,
  });

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
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
          controller: textEditingController,
          decoration: const InputDecoration(
            // border: InputBorder.,
            counter: null,
            counterText: "",
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            // constraints: BoxConstraints(maxHeight: 40),
          ),
          style: const TextStyle(
            fontSize: 18,
          ),
          maxLength: 1,
          // maxLengthEnforcement: MaxLengthEnforcement.enforced,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
