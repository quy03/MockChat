import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mock_chat/components/my_textfield.dart';
import '../../components/button_checkbox.dart';
import '../../components/my_button.dart';

class RegisterScreen extends StatelessWidget {
  final Function()? press;
  const RegisterScreen({super.key, this.press});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: size.height / 20),
                    GestureDetector(
                      onTap: press,
                      child: SvgPicture.asset(
                        "assets/icons/backward-arrow.svg",
                        height: 24,
                        width: 24,
                      ),
                    ),
                    SizedBox(height: size.height / 20),
                    // text đăng ký
                    Text(
                      "Đăng ký",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: size.height / 20),

                    // fullname textfield
                    const MyTextField(
                      svgIcon: 'assets/icons/user.svg',
                      labelText: 'HỌ VÀ TÊN',
                      hintText: 'Nhập họ và tên của bạn',
                      obscureText: false,
                    ),
                    SizedBox(height: size.height / 30),

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
                    SizedBox(height: size.height / 30),

                    // Checkbox đồng ý chính sách
                    const ButtonCheckbox(),
                    SizedBox(height: size.height / 15),

                    // nút đăng ký
                    MyButton(
                      text: 'ĐĂNG KÝ',
                      onTap: () {},
                    ),
                    SizedBox(height: size.height / 8),

                    // Đã có tài khoản? Đăng nhập ngay
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Đã có tài khoản?",
                          style:
                              TextStyle(color: Color.fromRGBO(57, 57, 57, 1)),
                        ),
                        GestureDetector(
                          onTap: press,
                          child: Text(
                            " Đăng nhập ngay",
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
