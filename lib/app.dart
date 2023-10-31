import 'package:dating_app/features/auth/sign_up_or_sign_in_screen.dart';
import 'package:dating_app/features/auth/sign_up_with_email_screen.dart';
import 'package:dating_app/features/auth/sign_up_with_phone_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'common/language/language_cubit.dart';
import 'features/onboarding_screen.dart';
import 'features/splash_screen.dart';
import 'network/client.dart';
import 'providers/auth.dart';
import 'util/theme_provider.dart';
import 'package:sizer/sizer.dart';

class MyApp extends StatefulWidget {
  final Locale appLocale;
  final SharedPreferences prefs;
  final bool showHome;
  const MyApp({
    Key? key,
    required this.appLocale,
    required this.prefs,
    required this.showHome,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final apiClient = GetIt.I<ApiClient>();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Auth(),
        ),
        BlocProvider(
          create: (_) => LanguageCubit(
            widget.appLocale,
            widget.prefs,
          ),
        ),
      ],
      child: DatingApp(
        appLocale: widget.appLocale,
        prefs: widget.prefs,
        showHome: widget.showHome,
      ),
    );
  }
}

class DatingApp extends StatefulWidget {
  final Locale appLocale;
  final SharedPreferences prefs;
  final bool showHome;
  const DatingApp(
      {Key? key,
      required this.appLocale,
      required this.prefs,
      required this.showHome,})
      : super(key: key);

  @override
  createState() => _DatingAppState();
}

class _DatingAppState extends State<DatingApp> {
  @override
  Widget build(BuildContext context) {
    debugPrint(widget.showHome.toString());
    return BlocBuilder<LanguageCubit, Locale>(
      builder: (context, state) {
        return Sizer(builder: (context, orientation, deviceType) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Dating App Name',
            themeMode: ThemeMode.light,
            theme: CustomTheme.lightTheme,
            darkTheme: CustomTheme.lightTheme,
            initialRoute: '/',
            routes: {
              '/': (context) => const OnboardingScreen(),
              SignUpOrSignInScreen.id: (context) => const SignUpOrSignInScreen(),
              SignUpWithEmailScreen.id: (context) => const SignUpWithEmailScreen(),
              SignUpWithPhoneScreen.id: (context) => const SignUpWithPhoneScreen(),
            },
            locale: state,
            localizationsDelegates: const [
              // AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('de', ''),
              Locale('en', ''),
              Locale('fr', ''),
              Locale('tr', ''),
              Locale('it'),
              Locale('mk'),
              Locale('sq'),
              Locale('sr'),
            ],
          );
        });
      },
    );
  }
}
