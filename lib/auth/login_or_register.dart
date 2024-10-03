import 'package:flutter/material.dart';
import 'package:mock_chat/screens/login_screen.dart';
import 'package:mock_chat/screens/register_screen.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLoginScreen = true;

  // chuyển đổi màn hình
  void toggleScreens() {
    setState(() {
      showLoginScreen = !showLoginScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginScreen) {
      return LoginScreen(press: toggleScreens);
    } else {
      return RegisterScreen(press: toggleScreens);
    }
  }
}
