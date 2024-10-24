import 'package:flutter/material.dart';

const kPrimaryColor = Color.fromRGBO(0, 0, 0, 1);
const kPrimaryLightColor = Color.fromRGBO(255, 255, 255, 1);
const kSecondaryColor = Color.fromRGBO(67, 86, 180, 1);

const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color.fromRGBO(67, 86, 180, 1),
    Color.fromRGBO(21, 207, 207, 1),
  ],
  stops: [0.1, 1],
);

const kTextColor = Color.fromRGBO(0, 0, 0, 1);

const kAnimationDuration = Duration(microseconds: 200);

final styleAppbar = TextStyle(
  color: kPrimaryLightColor,
  fontSize: 30,
);

final styleBody = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 16,
);
