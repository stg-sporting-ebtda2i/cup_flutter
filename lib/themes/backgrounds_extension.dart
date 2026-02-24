import 'package:flutter/material.dart';

class BackgroundsExtension extends ThemeExtension<BackgroundsExtension> {
  final String formBackground;
  final String profileBackground;
  final String leaderboardBackground;
  final String lineupBackground;
  final String serverDownBackground;
  final String splashBackground;
  final String userCardBackground;

  const BackgroundsExtension(
      {required this.formBackground,
      required this.profileBackground,
      required this.leaderboardBackground,
      required this.lineupBackground,
      required this.serverDownBackground,
      required this.splashBackground,
      required this.userCardBackground});

  @override
  ThemeExtension<BackgroundsExtension> copyWith(
      {String? formBackground,
      String? profileBackground,
      String? leaderboardBackground,
      String? lineupBackground,
      String? serverDownBackground,
      String? splashBackground,
      String? userCardBackground}) {
    return BackgroundsExtension(
      formBackground: formBackground ?? this.formBackground,
      profileBackground: profileBackground ?? this.profileBackground,
      leaderboardBackground:
          leaderboardBackground ?? this.leaderboardBackground,
      lineupBackground: lineupBackground ?? this.lineupBackground,
      serverDownBackground: serverDownBackground ?? this.serverDownBackground,
      splashBackground: splashBackground ?? this.splashBackground,
      userCardBackground: userCardBackground ?? this.userCardBackground,
    );
  }

  @override
  BackgroundsExtension lerp(
      covariant ThemeExtension<BackgroundsExtension>? other,
      double t,
      ) {
    if (other is! BackgroundsExtension) return this;
    return t < 0.5 ? this : other;
  }
}
