import 'package:dating_app/Authentication/forgot_password/forgot_password_screen.dart';
import 'package:dating_app/Authentication/forgot_password/verify_code_screen.dart';
import 'package:dating_app/Authentication/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangeForgottenPasswordScreen extends StatefulWidget {
  static String id = 'ChangeForgottenPasswordScreen';
  const ChangeForgottenPasswordScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ChangeForgottenPasswordScreenState createState() =>
      _ChangeForgottenPasswordScreenState();
}

class _ChangeForgottenPasswordScreenState
    extends State<ChangeForgottenPasswordScreen> {
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
                'Enter recovery email',
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
            const AuthInputField(
              label: 'johndoe@example.com',
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: GradientButton(
                label: 'Send Code',
                onTap: () {
                  Navigator.pushReplacementNamed(
                    context,
                    VerifyCodeScreen.id,
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
