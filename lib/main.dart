import 'package:dating_app/Account/account_screen.dart';
import 'package:dating_app/Authentication/forgot_password/change_forgotten_password_screen.dart';
import 'package:dating_app/Authentication/forgot_password/forgot_password_screen.dart';
import 'package:dating_app/Authentication/forgot_password/verify_code_screen.dart';
import 'package:dating_app/Authentication/login/login_screen.dart';
import 'package:dating_app/Authentication/register/register_screen.dart';
import 'package:dating_app/Onboarding/landing_screen.dart';
import 'package:dating_app/Onboarding/setup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'Common/theme_provider.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Dating App',
      themeMode: ref.watch(themeModeProvider),
      theme: ref.watch(lightThemeProvider),
      darkTheme: ref.watch(darkThemeProvider),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const LandingScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
        ForgotPasswordScreen.id: (context) => const ForgotPasswordScreen(),
        VerifyCodeScreen.id: (context) => const VerifyCodeScreen(),
        ChangeForgottenPasswordScreen.id: (context) =>
            const ChangeForgottenPasswordScreen(),
        RegisterScreen.id: (context) => const RegisterScreen(),
        SetupScreen.id: (context) => const SetupScreen(),
        AccountScreen.id: (context) => const AccountScreen(),
      },
    );
  }
}
