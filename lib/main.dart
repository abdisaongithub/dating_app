import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'Account/account_screen.dart';
import 'Authentication/forgot_password/change_forgotten_password_screen.dart';
import 'Authentication/forgot_password/forgot_password_screen.dart';
import 'Authentication/forgot_password/verify_code_screen.dart';
import 'Authentication/login/login_screen.dart';
import 'Authentication/register/register_screen.dart';
import 'Common/theme_provider.dart';
import 'Main/menu_screen.dart';
import 'Onboarding/landing_screen.dart';
import 'Onboarding/setup_screen.dart';

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
        MenuScreen.id: (context) => const MenuScreen(),
        // SwipeScreen.id: (context) => const SwipeScreen(),
      },
    );
  }
}
