import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    // Thiết lập màu cho theme sáng
    background: Color.fromRGBO(255, 255, 255, 1),
    primary: Color.fromRGBO(0, 0, 0, 1),
    secondary: Color.fromRGBO(67, 86, 180, 1),
    inversePrimary: Color.fromRGBO(153, 153, 153, 1),
  ),
  textTheme: ThemeData.light().textTheme.apply(
        // Thiết lập màu văn bản
        bodyColor: const Color.fromRGBO(0, 0, 0, 1),
        displayColor: const Color.fromRGBO(67, 86, 180, 1),
      ),
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      color: Color.fromRGBO(255, 255, 255, 1),
      fontSize: 30,
    ),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.grey.shade400,
    textTheme: ButtonTextTheme.primary,
  ),
  iconTheme: const IconThemeData(
    color: Colors.white,
  ),
);
