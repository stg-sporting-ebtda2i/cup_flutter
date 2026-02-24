import 'package:flutter/material.dart';
import 'package:piehme_cup_flutter/themes/states_colors_extension.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final double verticalPadding;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.isLoading,
    this.verticalPadding = 11
  });

  @override
  Widget build(BuildContext context) {
    final mainColor = Theme.of(
      context,
    ).extension<StatesColorsExtension>()!.mainColor;
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: verticalPadding),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: mainColor,
          disabledBackgroundColor: mainColor.withAlpha(89),
          foregroundColor: Colors.black,
          textStyle: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500, fontFamily: 'Dubai')),
      child: isLoading
          ? const SizedBox(
              width: 33,
              height: 33,
              child: Padding(
                padding: EdgeInsets.all(2),
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  color: Colors.black,
                ),
              ),
            )
          : Text(
              text,
              style: const TextStyle(),
            ),
    );
  }
}
