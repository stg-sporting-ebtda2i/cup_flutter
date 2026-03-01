import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:piehme_cup_flutter/routes/app_routes.dart';
import 'package:piehme_cup_flutter/services/auth_service.dart';
import 'package:piehme_cup_flutter/themes/backgrounds_extension.dart';
import 'package:piehme_cup_flutter/themes/main_colors_extension.dart';
import 'package:piehme_cup_flutter/utils/data_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  Future<void> _checkIfLoggedIn() async {
    String? token = await AuthService.getToken();
    bool isLoggedIn = token != null;

    await Future.delayed(Duration(milliseconds: 700));

    if (mounted && isLoggedIn) {
      await DataUtils.initApp(context, AppRoutes.home);
    } else if (mounted) {
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    }
  }

  @override
  void initState() {
    super.initState();
    _checkIfLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Image(
            image: AssetImage(
              theme.extension<BackgroundsExtension>()!.splashBackground,
            ),
            fit: BoxFit.cover,
            width: double.maxFinite,
            height: double.maxFinite,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                SizedBox(
                  width: 450,
                  height: 250,
                  child: Lottie.asset('assets/lottie/map-search.json'),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Looking for the Road...',
                      textStyle: GoogleFonts.leagueSpartan(
                        fontSize: 24,
                        color: theme
                            .extension<MainColorsExtension>()!
                            .splashScreenTextColor,
                        fontWeight: FontWeight.bold,
                      ),
                      speed: Duration(milliseconds: 200),
                    ),
                  ],
                  totalRepeatCount: 100, // Repeat many times
                  pause: Duration(milliseconds: 100),
                  displayFullTextOnTap: false,
                  stopPauseOnTap: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
