import 'package:flutter/material.dart';

class StatesColorsExtension extends ThemeExtension<StatesColorsExtension> {
  final Color textColor;
  final Color mainColor;
  final Color textFieldHint;
  final Color textFieldBackground;


  const StatesColorsExtension({
    required this.textColor,
    required this.mainColor,
    required this.textFieldHint,
    required this.textFieldBackground,
  });

  @override
  ThemeExtension<StatesColorsExtension> copyWith({
    Color? textColor,
    Color? mainColor,
    Color? textFieldHint,
    Color? textFieldBackground,
  }) {
    return StatesColorsExtension(
      textColor: textColor ?? this.textColor,
      mainColor: mainColor ?? this.mainColor,
      textFieldHint: textFieldHint ?? this.textFieldHint,
      textFieldBackground: textFieldBackground ?? this.textFieldBackground,
    );
  }

  @override
  StatesColorsExtension lerp(
    covariant ThemeExtension<StatesColorsExtension>? other,
    double t,
  ) {
    if (other is! StatesColorsExtension) return this;
    return StatesColorsExtension(
      textColor: Color.lerp(textColor, other.textColor, t) ?? textColor,
      mainColor: Color.lerp(mainColor, other.mainColor, t) ?? mainColor,
      textFieldHint: Color.lerp(textFieldHint, other.textFieldHint, t) ?? textFieldHint,
      textFieldBackground: Color.lerp(textFieldBackground, other.textFieldBackground, t) ?? textFieldBackground,
    );
  }
}
