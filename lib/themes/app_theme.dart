// lib/themes/app_theme.dart
import 'package:flutter/material.dart';
import 'package:piehme_cup_flutter/constants/app_colors.dart';
import 'package:piehme_cup_flutter/themes/backgrounds_extension.dart';

class AppTheme {

  static ThemeData rtglDarkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.brand, brightness: Brightness.light,),
    useMaterial3: true,
    extensions: [
      BackgroundsExtension(
        formBackground: 'assets/backgrounds/rtgl-dark/form_background.png',
        profileBackground: 'assets/backgrounds/rtgl-dark/profile_background.png',
        leaderboardBackground: 'assets/backgrounds/rtgl-dark/leaderboard_background.png',
        lineupBackground: 'assets/backgrounds/rtgl-dark/lineup_background.jpg',
        serverDownBackground: 'assets/backgrounds/rtgl-dark/server_down_background.jpg',
        splashBackground: 'assets/backgrounds/rtgl-dark/splash_background.png',
        userCardBackground: 'assets/backgrounds/rtgl-dark/user_card_background.jpg',
      ),
    ],
  );

  static ThemeData rtglLightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.brand, brightness: Brightness.light,),
    useMaterial3: true,
    extensions: [
      BackgroundsExtension(
        formBackground: 'assets/backgrounds/rtgl-light/form_background.png',
        lineupBackground: 'assets/backgrounds/rtgl-light/lineup_background.png',
        splashBackground: 'assets/backgrounds/rtgl-light/splash_background.png',
        profileBackground: 'assets/backgrounds/rtgl-light/profile_background.png',
        leaderboardBackground: 'assets/backgrounds/rtgl-light/leaderboard_background.png',
        serverDownBackground: 'assets/backgrounds/rtgl-light/server_down_background.png',
        userCardBackground: 'assets/backgrounds/rtgl-light/user_card_background.png',
      ),
    ],
  );

}