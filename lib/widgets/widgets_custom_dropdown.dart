import 'package:flutter/material.dart';
import 'package:piehme_cup_flutter/themes/states_colors_extension.dart';

class CustomDropdownMenu extends StatelessWidget {
  final List<String> items;
  final String? value;
  final ValueChanged<String?> onSelected;
  final String hint;

  const CustomDropdownMenu({
    super.key,
    required this.items,
    required this.value,
    required this.onSelected,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    final mainColor = Theme.of(
      context,
    ).extension<StatesColorsExtension>()!.mainColor;
    final textFieldHint = Theme.of(
      context,
    ).extension<StatesColorsExtension>()!.textFieldHint;
    final textFieldBackground = Theme.of(
      context,
    ).extension<StatesColorsExtension>()!.textFieldBackground;
    
    return TextSelectionTheme(
      data: TextSelectionThemeData(
        selectionColor: mainColor.withAlpha(77),
        selectionHandleColor: mainColor,
        cursorColor: mainColor,
      ),
      child: DropdownMenu<String>(
        dropdownMenuEntries: items.map((String item) {
          return DropdownMenuEntry<String>(
            value: item,
            label: item,
          );
        }).toList(),
        width: 385,
        textAlign: TextAlign.center,
        initialSelection: value,
        textStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontFamily: 'Dubai',
        ),
        menuStyle: MenuStyle(
            backgroundColor: WidgetStateProperty.all(Colors.white70),
            elevation: WidgetStateProperty.all(2),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            side: WidgetStateProperty.all(
              BorderSide(color: textFieldHint),
            ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
          filled: true,
          fillColor: textFieldBackground,
          labelStyle: TextStyle(
            fontSize: 18,
            color: textFieldHint,
            fontFamily: 'Dubai',
          ),
          floatingLabelStyle: TextStyle(
            fontSize: 18,
            color: mainColor,
            fontFamily: 'Dubai',
          ),
          hintStyle: TextStyle(
            fontSize: 20,
            color: textFieldHint,
            fontFamily: 'Dubai',
          ),
          prefixIconColor: textFieldHint,
          // Borders to match CustomTextField
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: textFieldHint),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: mainColor, width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.red),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: textFieldHint),
          ),
        ),
        onSelected: onSelected,
      ),
    );
  }
}
