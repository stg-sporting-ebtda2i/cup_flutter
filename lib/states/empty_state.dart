import 'package:flutter/material.dart';
import 'package:piehme_cup_flutter/themes/states_colors_extension.dart';

class EmptyState extends StatelessWidget {
  final IconData iconData;
  final String title;
  final String subtitle;

  const EmptyState(
      {super.key,
      required this.iconData,
      required this.title,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).extension<StatesColorsExtension>()!.textColor;
    
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Loading animation
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: color.withAlpha(26),
                shape: BoxShape.circle,
              ),
              child: Icon(
                iconData,
                color: color.withAlpha(170),
                size: 30,
              ),
            ),
            SizedBox(height: 24),

            // Loading text
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                color: color,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 12),

            Text(
              subtitle,
              style: TextStyle(
                fontSize: 14,
                color: color.withAlpha(170),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
