// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:mock_chat/components/my_textfield.dart';

import '../components/my_button.dart';
import '../helper/helper_fuction.dart';

class LoginScreen extends StatefulWidget {
  final Function()? press;
  const LoginScreen({
    Key? key,
    this.press,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // text controllers / kiểm soát và quản lý nội dung của trường nhập dữ liệu
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Hàm kiểm tra tính hợp lệ của email
  String? _validateEmail(String email) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(email)) {
      return 'Email không hợp lệ';
    }
    return null;
  }

  // Hàm kiểm tra tính hợp lệ của mật khẩu
  String? _validatePassword(String password) {
    final passwordRegex =
        RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d]{8,}$');
    if (!passwordRegex.hasMatch(password)) {
      return 'Mật khẩu phải có ít nhất 8 ký tự, 1 chữ cái thường, 1 chữ hoa và 1 số';
    }
    return null;
  }

  Future<void> loginUser() async {
    // Kiểm tra tính hợp lệ của email và mật khẩu
    final emailError = _validateEmail(emailController.text);
    final passwordError = _validatePassword(passwordController.text);

    if (emailError != null) {
      displayMessageToUser(emailError, context);
      return;
    }

    if (passwordError != null) {
      displayMessageToUser(passwordError, context);
      return;
    }

    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      if (context.mounted) {
        Navigator.pop(context);
      }

      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, '/message_screen');
    } on FirebaseException catch (e) {
      // Tắt loading
      // ignore: use_build_context_synchronously
      Navigator.pop(context);

      // Xử lý các lỗi thường gặp
      String errorMessage = '';
      if (e.code == 'email-already-in-use') {
        errorMessage = 'Email này đã được sử dụng';
      } else if (e.code == 'invalid-email') {
        errorMessage = 'Email không hợp lệ';
      } else if (e.code == 'weak-password') {
        errorMessage = 'Mật khẩu quá yếu';
      } else {
        errorMessage = 'Đã xảy ra lỗi. Vui lòng thử lại sau.';
      }

      // Hiển thị lỗi
      // ignore: use_build_context_synchronously
      displayMessageToUser(errorMessage, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: size.height,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: size.height / 12),
                      // Logo Login
                      Image.asset(
                        "assets/images/logo_login.png",
                        height: 124,
                        width: 124,
                      ),

                      // Text app name
                      const Text(
                        "Trải nghiệm Awesome chat",
                        style: TextStyle(fontSize: 26),
                      ),
                      // Text đăng nhập
                      Text(
                        "Đăng nhập",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: size.height / 60),

                      // email textfield
                      MyTextField(
                        svgIcon: 'assets/icons/mail.svg',
                        labelText: 'EMAIL',
                        hintText: 'Nhập email của bạn',
                        obscureText: false,
                        controller: emailController,
                      ),
                      SizedBox(height: size.height / 30),

                      // password textfield
                      MyTextField(
                        svgIcon: 'assets/icons/key.svg',
                        labelText: 'MẬT KHẨU',
                        hintText: 'Nhập mật khẩu của bạn',
                        obscureText: true,
                        controller: passwordController,
                      ),
                      SizedBox(height: size.height / 50),

                      // forgot password
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Quên mật khẩu?",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      // nút đăng nhập
                      MyButton(
                        text: 'ĐĂNG NHẬP',
                        onTap: loginUser,
                      ),
                      SizedBox(height: size.height / 10),

                      // Chưa có tài khoản? Đăng ký
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Chưa có tài khoản?",
                            style:
                                TextStyle(color: Color.fromRGBO(57, 57, 57, 1)),
                          ),
                          GestureDetector(
                            onTap: widget.press,
                            child: Text(
                              " Đăng ký ngay",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
