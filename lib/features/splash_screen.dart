import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../constants/svg_paths.dart';
import '../util/maps_util.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool imageLoaded = false;

  final splashLogo = SvgPicture.asset(
    SvgPaths.logoWhite,
    width: 150,
  );

  /// Precache image and display splash screen after image is loaded
  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      var loader = const SvgAssetLoader(SvgPaths.logoWhite);
      await svg.cache
          .putIfAbsent(loader.cacheKey(null), () => loader.loadBytes(null));
      imageLoaded = true;
      setState(() {});
    });
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();

    // context.read<Auth>().tryAutoLogin().then(_endSplashScreenIfMounted);

    Future.delayed(const Duration(seconds: 3)).then(_endSplashScreenIfMounted);
  }

  void _endSplashScreenIfMounted(dynamic val) {
    if (mounted) {
      // Navigator.of(context).pushReplacement(
        // PageRouteBuilder(
        //   pageBuilder: (context, animation1, animation2) => const Navigation(),
        //   transitionDuration: Duration.zero,
        // ),
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    // init(context);

    initializeMapPin();
    return Scaffold(
      body: imageLoaded
          ? Container(
              color: Colors.red,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  splashLogo,
                  const SizedBox(height: 8),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    width: double.infinity,
                    child: const Center(
                      child: Text(
                        'AppLocalizations.of(context)!.splash_screen_text',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Container(),
    );
  }

  Future<void> initializeMapPin() async {
    final screenWidth = MediaQuery.of(context).size.width;

    // Width is 72dp in a 360dp screen, so we scale it
    // for larger screens
    final pinWidth = 72 * screenWidth / 360;

    MapsUtil.initialize(pinWidth.floor());
  }
}
