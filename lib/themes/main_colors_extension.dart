import 'package:flutter/material.dart';

class MainColorsExtension extends ThemeExtension<MainColorsExtension> {
  final Color splashScreenTextColor;
  final Color bottomNavBarBackground;
  final Color bottomNavBarForeground;
  final Color bottomNavBarSelected;
  final Color topGradient;

  const MainColorsExtension({
    required this.splashScreenTextColor,
    required this.bottomNavBarBackground,
    required this.bottomNavBarForeground,
    required this.bottomNavBarSelected,
    required this.topGradient,
  });

  @override
  ThemeExtension<MainColorsExtension> copyWith({
    Color? splashScreenTextColor,
    Color? bottomNavBarBackground,
    Color? bottomNavBarForeground,
    Color? bottomNavBarSelected,
    Color? topGradient,
  }) {
    return MainColorsExtension(
      splashScreenTextColor:
          splashScreenTextColor ?? this.splashScreenTextColor,
      bottomNavBarBackground:
          bottomNavBarBackground ?? this.bottomNavBarBackground,
      bottomNavBarForeground:
          bottomNavBarForeground ?? this.bottomNavBarForeground,
      bottomNavBarSelected: bottomNavBarSelected ?? this.bottomNavBarSelected,
      topGradient: topGradient ?? this.topGradient,
    );
  }

  @override
  MainColorsExtension lerp(
    covariant ThemeExtension<MainColorsExtension>? other,
    double t,
  ) {
    if (other is! MainColorsExtension) return this;
    return MainColorsExtension(
      splashScreenTextColor:
          Color.lerp(splashScreenTextColor, other.splashScreenTextColor, t) ??
          splashScreenTextColor,
      bottomNavBarBackground:
          Color.lerp(bottomNavBarBackground, other.bottomNavBarBackground, t) ??
          bottomNavBarBackground,
      bottomNavBarForeground:
          Color.lerp(bottomNavBarForeground, other.bottomNavBarForeground, t) ??
          bottomNavBarForeground,
      bottomNavBarSelected:
          Color.lerp(bottomNavBarSelected, other.bottomNavBarSelected, t) ??
          bottomNavBarSelected,
      topGradient:
          Color.lerp(topGradient, other.topGradient, t) ??
              topGradient,
    );
  }
}
