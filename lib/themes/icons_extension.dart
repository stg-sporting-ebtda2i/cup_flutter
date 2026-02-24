import 'package:flutter/material.dart';

class IconsExtension extends ThemeExtension<IconsExtension> {
  final String chemistry0;
  final String chemistry1;
  final String chemistry2;
  final String chemistry3;
  final String coin;

  const IconsExtension({
    required this.chemistry0,
    required this.chemistry1,
    required this.chemistry2,
    required this.chemistry3,
    required this.coin,
  });

  @override
  ThemeExtension<IconsExtension> copyWith({
    String? chemistry0,
    String? chemistry1,
    String? chemistry2,
    String? chemistry3,
    String? coin,
  }) {
    return IconsExtension(
      chemistry0: chemistry0 ?? this.chemistry0,
      chemistry1: chemistry1 ?? this.chemistry1,
      chemistry2: chemistry2 ?? this.chemistry2,
      chemistry3: chemistry3 ?? this.chemistry3,
      coin: coin ?? this.coin,
    );
  }

  @override
  IconsExtension lerp(
    covariant ThemeExtension<IconsExtension>? other,
    double t,
  ) {
    if (other is! IconsExtension) return this;
    return t < 0.5 ? this : other;
  }
}
