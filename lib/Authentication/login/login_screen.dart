// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'LoginScreen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromRGBO(99, 109, 117, 1),
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
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Text(
                    'SIGN UP',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 42,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: Text(
                    'E-mail',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
                const AuthInputField(
                  label: 'johndoe@example.com',
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: Text(
                    'Password',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
                const AuthInputField(
                  label: 'Password',
                  obscure: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      debugPrint('SIGN UP');
                    },
                    child: Container(
                      height: 40,
                      width: 150,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(0, 179, 255, 1),
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            offset: const Offset(5, 5),
                            blurRadius: 10,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          'SIGN UP',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      color: Colors.white,
                      height: 1,
                      width: (MediaQuery.of(context).size.width - 100) / 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: Text(
                        'OR',
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      height: 1,
                      width: (MediaQuery.of(context).size.width - 100) / 2,
                    ),
                  ],
                ),
                SocialSignIn(
                  label: 'Continue With Google',
                  icon: BrandLogo(
                    BrandLogos.google,
                    size: 22,
                  ),
                  onTap: () {},
                ),
                SocialSignIn(
                  label: 'Sign In With Apple ID',
                  icon: BrandLogo(
                    BrandLogos.apple,
                    size: 22,
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SocialSignIn extends StatelessWidget {
  const SocialSignIn({
    Key? key,
    required this.label,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final String label;
  final BrandLogo icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      margin: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: const Offset(5, 5),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          icon,
        ],
      ),
    );
  }
}

class AuthInputField extends StatefulWidget {
  const AuthInputField({
    Key? key,
    required this.label,
    this.obscure = false,
  }) : super(key: key);
  final String label;
  final bool obscure;

  @override
  State<AuthInputField> createState() => _AuthInputFieldState();
}

class _AuthInputFieldState extends State<AuthInputField> {
  late bool invisible;

  @override
  void initState() {
    invisible = widget.obscure;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 60,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                offset: const Offset(5, 5),
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Center(
            child: TextField(
              obscureText: invisible,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.label,
                hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.4),
                ),
              ),
              style: GoogleFonts.montserrat(),
            ),
          ),
        ),
        widget.obscure == false
            ? const SizedBox()
            : Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 40,
                    top: 28,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        invisible = !invisible;
                        invisible
                            ? debugPrint('Hidden')
                            : debugPrint('Visible');
                      });
                    },
                    child: invisible
                        ? const Icon(
                            FontAwesome.eye_slash,
                            size: 22,
                          )
                        : const Icon(
                            FontAwesome.eye,
                            size: 22,
                          ),
                  ),
                ),
              ),
      ],
    );
  }
}
