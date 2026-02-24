import 'package:flutter/material.dart';

class PlaceholdersExtension extends ThemeExtension<PlaceholdersExtension> {
  final String emptyCardPlaceholder; // with stars effect in lineup
  final String emptyIconPlaceholder; // without start effect
  final String loadingPlaceholder;
  final String errorPlaceholder;

  const PlaceholdersExtension(
      {required this.emptyCardPlaceholder,
      required this.emptyIconPlaceholder,
      required this.loadingPlaceholder,
      required this.errorPlaceholder});

  @override
  ThemeExtension<PlaceholdersExtension> copyWith(
      {String? emptyCardPlaceholder,
      String? emptyIconPlaceholder,
      String? loadingPlaceholder,
      String? errorPlaceholder,}) {
    return PlaceholdersExtension(
      emptyCardPlaceholder: emptyCardPlaceholder ?? this.emptyCardPlaceholder,
      emptyIconPlaceholder: emptyIconPlaceholder ?? this.emptyIconPlaceholder,
      loadingPlaceholder:
          loadingPlaceholder ?? this.loadingPlaceholder,
      errorPlaceholder: errorPlaceholder ?? this.errorPlaceholder,
    );
  }

  @override
  PlaceholdersExtension lerp(
      covariant ThemeExtension<PlaceholdersExtension>? other,
      double t,
      ) {
    if (other is! PlaceholdersExtension) return this;
    return t < 0.5 ? this : other;
  }
}
