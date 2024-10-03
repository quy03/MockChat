import 'package:flutter/material.dart';

class MySearch extends StatelessWidget {
  const MySearch({
    super.key,
    required this.hintText,
  });
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromRGBO(255, 255, 255, 1),
        hintText: hintText,
        prefixIcon: const Icon(
          Icons.search,
          color: Color.fromRGBO(67, 86, 180, 1),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 0),
      ),
    );
  }
}
