import 'package:flutter/material.dart';
import 'package:mock_chat/components/custom_suffix_icon.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required this.svgIcon,
    required this.labelText,
    required this.hintText,
    required this.obscureText,
    required this.controller,
    this.onChanged,
    this.validator,
    this.keyboardType = TextInputType.text,
  });

  final String svgIcon, labelText, hintText;
  final bool obscureText;
  final TextEditingController controller;
  final ValueChanged<String>?
      onChanged; // Thêm onChanged để lắng nghe sự thay đổi
  final FormFieldValidator<String>? validator; // Thêm validator để kiểm tra lỗi
  final TextInputType keyboardType; // Cho phép tuỳ chỉnh loại bàn phím

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      onChanged: onChanged,
      validator: validator, // Dùng validator để kiểm tra lỗi
      keyboardType: keyboardType, // Tuỳ chỉnh kiểu bàn phím
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: svgIcon),
      ),
    );
  }
}
