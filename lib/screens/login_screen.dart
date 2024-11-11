import 'package:flutter/material.dart';
import 'package:mock_chat/components/my_textfield.dart';
import 'package:mock_chat/provider/user_provider.dart';
import 'package:provider/provider.dart';

import '../auth/auth_methods.dart';
import '../components/my_button.dart';
import '../helper/helper_fuction.dart';
import '../localization/app_localization.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback onSwitch;
  const LoginScreen({
    super.key,
    required this.onSwitch,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthMethods _authMethods = AuthMethods();

  // text controllers / kiểm soát và quản lý nội dung của trường nhập dữ liệu
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // giải phóng dữ liệu không cần thiết
  // @override
  // void dispose() {
  //   emailController.dispose();
  //   passwordController.dispose();
  //   super.dispose();
  // }

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

    String? result = await _authMethods.loginUser(
      email: emailController.text,
      password: passwordController.text,
    );

    if (mounted) Navigator.pop(context);

    if (result != null) {
      displayMessageToUser(result, context);
    } else {
      Provider.of<UserProvider>(context, listen: false).refreshUser();
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
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
                      Text(
                        AppLocalization.of(context)!.translate('Experience'),
                        style: TextStyle(fontSize: 26),
                      ),
                      // Text đăng nhập
                      Text(
                        AppLocalization.of(context)!.translate('Login'),
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
                        hintText: AppLocalization.of(context)!
                            .translate('EnterYourEmail'),
                        obscureText: false,
                        controller: emailController,
                      ),
                      SizedBox(height: size.height / 30),

                      // password textfield
                      MyTextField(
                        svgIcon: 'assets/icons/key.svg',
                        labelText:
                            AppLocalization.of(context)!.translate('Password'),
                        hintText: AppLocalization.of(context)!
                            .translate('EnterYourPassword'),
                        obscureText: true,
                        controller: passwordController,
                      ),
                      SizedBox(height: size.height / 50),

                      // forgot password
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            AppLocalization.of(context)!
                                .translate('ForgotYourPassword'),
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
                        text: AppLocalization.of(context)!.translate('Login'),
                        onTap: loginUser,
                      ),
                      SizedBox(height: size.height / 10),

                      // Chưa có tài khoản? Đăng ký
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppLocalization.of(context)!
                                .translate('DoNotHaveAnAccount'),
                            style:
                                TextStyle(color: Color.fromRGBO(57, 57, 57, 1)),
                          ),
                          GestureDetector(
                            onTap: widget.onSwitch,
                            child: Text(
                              AppLocalization.of(context)!
                                  .translate('SignUpNow'),
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
