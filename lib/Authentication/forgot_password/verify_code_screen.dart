// ignore_for_file: library_private_types_in_public_api

import 'package:dating_app/Authentication/forgot_password/change_forgotten_password_screen.dart';
import 'package:dating_app/Authentication/forgot_password/forgot_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VerifyCodeScreen extends StatefulWidget {
  static String id = 'VerifyCodeScreen';
  const VerifyCodeScreen({Key? key}) : super(key: key);

  @override
  _VerifyCodeScreenState createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(41, 171, 226, 0.6),
              Color.fromRGBO(154, 53, 251, 0),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: Text(
                    'Forgot Password',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
              ),
              child: Text(
                'Enter 6-digit code',
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DigitInput(
                  onChanged: (val) {},
                ),
                DigitInput(
                  onChanged: (val) {},
                ),
                DigitInput(
                  onChanged: (val) {},
                ),
                DigitInput(
                  onChanged: (val) {},
                ),
                DigitInput(
                  onChanged: (val) {},
                ),
                DigitInput(
                  onChanged: (val) {},
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: GradientButton(
                label: 'Verify Code',
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    ChangeForgottenPasswordScreen.id,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DigitInput extends StatelessWidget {
  const DigitInput({
    Key? key,
    required this.onChanged,
  }) : super(key: key);
  final Function(String? val)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      margin: const EdgeInsets.only(
        left: 4,
        right: 4,
      ),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 0.33),
        borderRadius: BorderRadius.circular(5),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.15),
            blurRadius: 5,
            spreadRadius: -5,
          ),
        ],
      ),
      child: Center(
        child: TextField(
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          // TODO: Implement features later
          maxLines: 1,
          onChanged: onChanged,
          expands: false,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.number,
          autofocus: true,
          showCursor: false,
          cursorColor: Colors.transparent,
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
