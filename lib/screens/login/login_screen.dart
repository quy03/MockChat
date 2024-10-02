import 'package:flutter/material.dart';
import 'package:mock_chat/components/my_textfield.dart';
import '../../components/my_button.dart';

class LoginScreen extends StatelessWidget {
  final Function()? press;
  const LoginScreen({super.key, this.press});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
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
                    const MyTextField(
                      svgIcon: 'assets/icons/mail.svg',
                      labelText: 'EMAIL',
                      hintText: 'Nhập email của bạn',
                      obscureText: false,
                    ),
                    SizedBox(height: size.height / 30),

                    // password textfield
                    const MyTextField(
                      svgIcon: 'assets/icons/key.svg',
                      labelText: 'MẬT KHẨU',
                      hintText: 'Nhập mật khẩu của bạn',
                      obscureText: true,
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
                      onTap: () {},
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
                          onTap: press,
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
    );
  }
}
