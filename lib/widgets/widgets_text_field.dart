import 'package:flutter/material.dart';
import 'package:piehme_cup_flutter/themes/states_colors_extension.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final Icon icon;
  final TextEditingController controller;
  final TextInputType inputType;
  final bool? obscure;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;
  final bool? editable;

  const CustomTextField({
    super.key,
    required this.hint,
    required this.icon,
    required this.controller,
    required this.inputType,
    this.obscure = false,
    this.validator,
    this.onTap,
    this.editable = false,
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
    
    return TextFormField(
      style: TextStyle(
        fontSize: 20,
        color: Colors.white,
        fontFamily: 'Dubai'
      ),
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 15),
        filled: true,
        fillColor: textFieldBackground,
        labelStyle: TextStyle(
          fontSize: 18,
          color: textFieldHint,
            fontFamily: 'Dubai'
        ),
        floatingLabelStyle: TextStyle(
          fontSize: 18,
          color: mainColor,
            fontFamily: 'Dubai'
        ),
        labelText: hint,
        prefixIcon: icon,
        prefixIconColor: textFieldHint,
        // Common border for most states
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
      keyboardType: inputType,
      obscureText: obscure!,
      onTap: onTap,
      readOnly: editable!,
      validator: validator,
    );
  }
}