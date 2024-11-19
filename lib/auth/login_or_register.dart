import 'package:flutter/material.dart';
import 'package:mock_chat/screens/login/login_screen.dart';
import 'package:mock_chat/screens/register/register_screen.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  int currentIndex = 0;

  // chuyển đổi màn hình
  void toggleScreens() {
    setState(() {
      currentIndex = (currentIndex == 0) ? 1 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: [
          LoginScreen(onSwitch: toggleScreens),
          RegisterScreen(onSwitch: toggleScreens),
        ],
      ),
    );
  }
}
