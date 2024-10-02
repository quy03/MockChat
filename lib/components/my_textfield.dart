import 'package:flutter/material.dart';
import 'package:mock_chat/components/custom_suffix_icon.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required this.svgIcon,
    required this.labelText,
    required this.hintText,
    required this.obscureText,
  });
  final String svgIcon, labelText, hintText;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: svgIcon),
      ),
      obscureText: obscureText,
    );
  }
}
