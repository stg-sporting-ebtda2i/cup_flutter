import 'package:flutter/material.dart';

class GradientsExtension extends ThemeExtension<GradientsExtension> {
  final List<Color> solveQuiz;
  final List<Color> attendanceList;
  final List<Color> quizzesList;
  final List<Color> store;

  const GradientsExtension({
    required this.solveQuiz,
    required this.attendanceList,
    required this.quizzesList,
    required this.store,
  });

  @override
  GradientsExtension copyWith({
    List<Color>? solveQuiz,
    List<Color>? attendanceList,
    List<Color>? quizzesList,
    List<Color>? store,
  }) {
    return GradientsExtension(
      solveQuiz: solveQuiz ?? this.solveQuiz,
      attendanceList: attendanceList ?? this.attendanceList,
      quizzesList: quizzesList ?? this.quizzesList,
      store: store ?? this.store,
    );
  }

  @override
  GradientsExtension lerp(
      covariant ThemeExtension<GradientsExtension>? other,
      double t,
      ) {
    if (other is! GradientsExtension) return this;

    // Helper function to interpolate between two color lists
    List<Color> interpolateLists(List<Color> list1, List<Color> list2) {
      final int list1Length = list1.length;
      final int list2Length = list2.length;

      return List.generate(
        list1Length > list2Length ? list1Length : list2Length,
            (index) {
          final Color? color1 = index < list1Length ? list1[index] : null;
          final Color? color2 = index < list2Length ? list2[index] : null;

          if (color1 == null && color2 == null) return Colors.transparent;
          if (color1 == null) return color2!;
          if (color2 == null) return color1;

          return Color.lerp(color1, color2, t)!;
        },
      );
    }

    return GradientsExtension(
      solveQuiz: interpolateLists(solveQuiz, other.solveQuiz),
      attendanceList: interpolateLists(attendanceList, other.attendanceList),
      quizzesList: interpolateLists(quizzesList, other.quizzesList),
      store: interpolateLists(store, other.store),
    );
  }
}