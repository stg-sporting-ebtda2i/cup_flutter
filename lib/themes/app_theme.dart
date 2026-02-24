// lib/themes/app_theme.dart
import 'package:flutter/material.dart';
import 'package:piehme_cup_flutter/themes/backgrounds_extension.dart';
import 'package:piehme_cup_flutter/themes/gradients_extension.dart';
import 'package:piehme_cup_flutter/themes/main_colors_extension.dart';
import 'package:piehme_cup_flutter/themes/icons_extension.dart';
import 'package:piehme_cup_flutter/themes/placeholders_extension.dart';
import 'package:piehme_cup_flutter/themes/states_colors_extension.dart';

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
      MainColorsExtension(
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
      StatesColorsExtension(
        textColor: Colors.white,
        mainColor: rtglDarkBrandColor,
        textFieldHint: Color.fromARGB(215, 255, 255, 255),
        textFieldBackground: Color.fromARGB(176, 19, 19, 19),
      ),
      GradientsExtension(
        solveQuiz: [Color(0xFF1a2a3a), Color(0xFF0d1b2a), Color(0xFF050a14)],
        attendanceList: [
          Color(0xFF023D4D),
          Color(0xFF34443C),
          Color(0xFF230D19),
        ],
        quizzesList: [Color(0xFF8A7C57), Color(0xFF16393F), Color(0xFF050514)],
        store: [
            Color(0xFF054127),
            Color(0xFF032C28),
            Color(0xFF021C29),
            Color(0xFF250D1B),
            Color(0xFF50121F),
          ]
      ),
    ],
  );

  static final rtglLightBrandColor = Color(0xFFFDE387);

  static ThemeData rtglLightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: rtglLightBrandColor,
      brightness: Brightness.light,
    ),
    useMaterial3: true,
    extensions: [
      BackgroundsExtension(
        formBackground: 'assets/backgrounds/rtgl-light/form_background.png',
        lineupBackground: 'assets/backgrounds/rtgl-light/lineup_background.jpg',
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
      MainColorsExtension(
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
      StatesColorsExtension(
        textColor: Colors.black,
        mainColor: rtglLightBrandColor,
        textFieldHint: Color.fromARGB(215, 255, 255, 255),
        textFieldBackground: Color.fromARGB(176, 19, 19, 19),
      ),
      GradientsExtension(
        solveQuiz: [Color(0xFF0293DD), Color(0xFFD3B991), Color(0xFF7A491D)],
        attendanceList: [
          Color(0xFF0293DD),
          Color(0xFFD3B991),
          Color(0xFF7A491D),
        ],
        quizzesList: [Color(0xFF0293DD), Color(0xFFD3B991), Color(0xFF7A491D)],
        store: [Color(0xFF0293DD), Color(0xFFD3B991), Color(0xFF7A491D)],
      ),
    ],
  );


  static final rtblBrandColor = Color.fromARGB(255, 246, 233, 175);

  static ThemeData rtblTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: rtblBrandColor,
      brightness: Brightness.dark,
    ),
    useMaterial3: true,
    extensions: [
      BackgroundsExtension(
        formBackground: 'assets/backgrounds/rtbl/form_background.png',
        lineupBackground: 'assets/backgrounds/rtbl/lineup_background.jpg',
        splashBackground: 'assets/backgrounds/rtbl/splash_background.png',
        profileBackground:
        'assets/backgrounds/rtbl/profile_background.png',
        leaderboardBackground:
        'assets/backgrounds/rtbl/leaderboard_background.png',
        serverDownBackground:
        'assets/backgrounds/rtbl/server_down_background.png',
        userCardBackground:
        'assets/backgrounds/rtbl/user_card_background.png',
      ),
      MainColorsExtension(
        splashScreenTextColor: Color.fromARGB(255, 217, 217, 217),
        bottomNavBarBackground: Colors.black,
        bottomNavBarForeground: Color(0xFF9D9D9D),
        bottomNavBarSelected: rtblBrandColor,
        topGradient: Colors.black,
      ),
      PlaceholdersExtension(
        emptyCardPlaceholder:
        'assets/placeholder/rtbl/empty_card_placeholder.png',
        emptyIconPlaceholder:
        'assets/placeholder/rtbl/empty_card_placeholder.png',
        loadingPlaceholder:
        'assets/placeholder/rtbl/loading_card_placeholder.png',
        errorPlaceholder:
        'assets/placeholder/rtbl/error_card_placeholder.png',
      ),
      IconsExtension(
        chemistry0: 'assets/icons/rtbl/chemistry_0.png',
        chemistry1: 'assets/icons/rtbl/chemistry_1.png',
        chemistry2: 'assets/icons/rtbl/chemistry_2.png',
        chemistry3: 'assets/icons/rtbl/chemistry_3.png',
        coin: 'assets/icons/rtbl/coin.png',
      ),
      StatesColorsExtension(
        textColor: Colors.white,
        mainColor: rtblBrandColor,
        textFieldHint: Color.fromARGB(215, 255, 255, 255),
        textFieldBackground: Color.fromARGB(176, 19, 19, 19),
      ),
      GradientsExtension(
          solveQuiz: [Color(0xFF1a2a3a), Color(0xFF0d1b2a), Color(0xFF050a14)],
          attendanceList: [
            Color(0xFF023D4D),
            Color(0xFF34443C),
            Color(0xFF230D19),
          ],
          quizzesList: [Color(0xFF8A7C57), Color(0xFF16393F), Color(0xFF050514)],
          store: [
            Color(0xFF054127),
            Color(0xFF032C28),
            Color(0xFF021C29),
            Color(0xFF250D1B),
            Color(0xFF50121F),
          ]
      ),
    ],
  );
}
