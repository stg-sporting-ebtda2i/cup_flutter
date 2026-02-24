// lib/themes/app_theme.dart
import 'package:flutter/material.dart';
import 'package:piehme_cup_flutter/constants/app_colors.dart';
import 'package:piehme_cup_flutter/themes/backgrounds_extension.dart';
import 'package:piehme_cup_flutter/themes/colors_extension.dart';
import 'package:piehme_cup_flutter/themes/icons_extension.dart';
import 'package:piehme_cup_flutter/themes/placeholders_extension.dart';

class AppTheme {
  static final rtglDarkBrandColor = Color.fromARGB(255, 248, 195, 127);

  static ThemeData rtglDarkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: rtglDarkBrandColor,
      brightness: Brightness.light,
    ),
    useMaterial3: true,
    extensions: [
      BackgroundsExtension(
        formBackground: 'assets/backgrounds/rtgl-dark/form_background.png',
        profileBackground:
            'assets/backgrounds/rtgl-dark/profile_background.png',
        leaderboardBackground:
            'assets/backgrounds/rtgl-dark/leaderboard_background.png',
        lineupBackground: 'assets/backgrounds/rtgl-dark/lineup_background.jpg',
        serverDownBackground:
            'assets/backgrounds/rtgl-dark/server_down_background.jpg',
        splashBackground: 'assets/backgrounds/rtgl-dark/splash_background.png',
        userCardBackground:
            'assets/backgrounds/rtgl-dark/user_card_background.jpg',
      ),
      ColorsExtension(
        splashScreenTextColor: Color.fromARGB(255, 217, 217, 217),
        bottomNavBarBackground: Colors.black,
        bottomNavBarForeground: Color(0xFF9D9D9D),
        bottomNavBarSelected: rtglDarkBrandColor,
        topGradient: Colors.black,
      ),
      PlaceholdersExtension(
        emptyCardPlaceholder:
            'assets/placeholder/rtgl-dark/empty_card_placeholder.png',
        emptyIconPlaceholder:
            'assets/placeholder/rtgl-dark/empty_card_placeholder.png',
        loadingPlaceholder:
            'assets/placeholder/rtgl-dark/loading_card_placeholder.png',
        errorPlaceholder:
            'assets/placeholder/rtgl-dark/error_card_placeholder.png',
      ),
      IconsExtension(
        chemistry0: 'assets/icons/rtgl-dark/chemistry_0.png',
        chemistry1: 'assets/icons/rtgl-dark/chemistry_1.png',
        chemistry2: 'assets/icons/rtgl-dark/chemistry_2.png',
        chemistry3: 'assets/icons/rtgl-dark/chemistry_3.png',
        coin: 'assets/icons/rtgl-dark/coin.png',
      ),
    ],
  );

  static final rtglLightBrandColor = Color(0xFFFDE387);

  static ThemeData rtglLightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.brand,
      brightness: Brightness.light,
    ),
    useMaterial3: true,
    extensions: [
      BackgroundsExtension(
        formBackground: 'assets/backgrounds/rtgl-light/form_background.png',
        lineupBackground:
            'assets/backgrounds/rtgl-light/lineup_background.jpg',
        splashBackground: 'assets/backgrounds/rtgl-light/splash_background.png',
        profileBackground:
            'assets/backgrounds/rtgl-light/profile_background.png',
        leaderboardBackground:
            'assets/backgrounds/rtgl-light/leaderboard_background.png',
        serverDownBackground:
            'assets/backgrounds/rtgl-light/server_down_background.png',
        userCardBackground:
            'assets/backgrounds/rtgl-light/user_card_background.png',
      ),
      ColorsExtension(
        splashScreenTextColor: Color.fromARGB(255, 38, 38, 38),
        bottomNavBarBackground: Color(0xFF200A00),
        bottomNavBarForeground: Color(0xFFA1794A),
        bottomNavBarSelected: Color(0xFFFDE387),
        topGradient: Color(0xFF0D2A33),
      ),
      PlaceholdersExtension(
        emptyCardPlaceholder:
            'assets/placeholder/rtgl-light/empty_card_placeholder.png',
        emptyIconPlaceholder:
            'assets/placeholder/rtgl-light/empty_card_placeholder.png',
        loadingPlaceholder:
            'assets/placeholder/rtgl-light/loading_card_placeholder.png',
        errorPlaceholder:
            'assets/placeholder/rtgl-light/error_card_placeholder.png',
      ),
      IconsExtension(
        chemistry0: 'assets/icons/rtgl-light/chemistry_0.png',
        chemistry1: 'assets/icons/rtgl-light/chemistry_1.png',
        chemistry2: 'assets/icons/rtgl-light/chemistry_2.png',
        chemistry3: 'assets/icons/rtgl-light/chemistry_3.png',
        coin: 'assets/icons/rtgl-dark/coin.png',
      ),
    ],
  );
}
