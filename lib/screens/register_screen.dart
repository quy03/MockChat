import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mock_chat/contants.dart';
import '../auth/auth_methods.dart';
import '../components/my_button.dart';
import '../components/my_textfield.dart';
import '../helper/helper_fuction.dart';
import '../localization/app_localization.dart';

class RegisterScreen extends StatefulWidget {
  final VoidCallback onSwitch;
  const RegisterScreen({
    super.key,
    required this.onSwitch,
  });

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final AuthMethods _authMethods = AuthMethods();
  // kiểm tra nút checkbox
  bool _isChecked = false;
  String? checkBox;

  // text controllers / kiểm soát và quản lý nội dung của trường nhập dữ liệu
  TextEditingController fullnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // giải phóng dữ liệu không cần thiết
  // @override
  // void dispose() {
  //   fullnameController.dispose();
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

  Future<void> registerUser() async {
    final emailError = _validateEmail(emailController.text);
    final passwordError = _validatePassword(passwordController.text);

    if (fullnameController.text.isEmpty) {
      displayMessageToUser("Vui lòng nhập tên đầy đủ", context);
      return;
    }

    if (emailError != null) {
      displayMessageToUser(emailError, context);
      return;
    }

    if (passwordError != null) {
      displayMessageToUser(passwordError, context);
      return;
    }

    if (!_isChecked) {
      setState(() {
        checkBox = "Bạn phải đồng ý với chính sách và điều khoản";
      });
      displayMessageToUser(checkBox!, context);
      return;
    }

    final result = await _authMethods.registerUser(
      email: emailController.text,
      password: passwordController.text,
      fullname: fullnameController.text,
    );

    if (result != null) {
      displayMessageToUser(result, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kPrimaryLightColor,
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
                      SizedBox(height: size.height / 20),
                      GestureDetector(
                        onTap: widget.onSwitch,
                        child: SvgPicture.asset(
                          "assets/icons/backward-arrow.svg",
                          height: 24,
                          width: 24,
                        ),
                      ),
                      SizedBox(height: size.height / 20),
                      // text đăng ký
                      Text(
                        AppLocalization.of(context).translate('SignUp'),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: size.height / 20),
                      // fullname textfield
                      MyTextField(
                        svgIcon: 'assets/icons/user.svg',
                        labelText:
                            AppLocalization.of(context).translate('FullName'),
                        hintText: AppLocalization.of(context)
                            .translate('EnterYourFullName'),
                        obscureText: false,
                        controller: fullnameController,
                      ),
                      SizedBox(height: size.height / 30),

                      // email textfield
                      MyTextField(
                        svgIcon: 'assets/icons/mail.svg',
                        labelText: 'EMAIL',
                        hintText: AppLocalization.of(context)
                            .translate('EnterYourEmail'),
                        obscureText: false,
                        controller: emailController,
                      ),
                      SizedBox(height: size.height / 30),

                      // password textfield
                      MyTextField(
                        svgIcon: 'assets/icons/key.svg',
                        labelText:
                            AppLocalization.of(context).translate('Password'),
                        hintText: AppLocalization.of(context)
                            .translate('EnterYourPassword'),
                        obscureText: true,
                        controller: passwordController,
                      ),

                      SizedBox(height: size.height / 30),

                      // Checkbox đồng ý chính sách
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _isChecked = !_isChecked;
                                checkBox = null;
                              });
                            },
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: _isChecked
                                      ? Theme.of(context).colorScheme.secondary
                                      : Colors.grey,
                                  width: 2,
                                ),
                                color: _isChecked
                                    ? Theme.of(context).colorScheme.secondary
                                    : Colors.transparent,
                              ),
                              child: _isChecked
                                  ? const Icon(
                                      Icons.check,
                                      size: 16,
                                      color: Colors.white,
                                    )
                                  : null,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      "${AppLocalization.of(context).translate('IagreeToThe')} ",
                                  style: TextStyle(
                                      color: Color.fromRGBO(57, 57, 57, 1)),
                                ),
                                TextSpan(
                                  text:
                                      "${AppLocalization.of(context).translate('Policies')} ",
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      "${AppLocalization.of(context).translate('And')} ",
                                  style: TextStyle(
                                      color: Color.fromRGBO(57, 57, 57, 1)),
                                ),
                                TextSpan(
                                  text: AppLocalization.of(context)
                                      .translate('Terms'),
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height / 20),

                      // nút đăng ký
                      MyButton(
                        text: AppLocalization.of(context).translate('SignUp'),
                        onTap: registerUser,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(height: size.height / 10),

                      // Đã có tài khoản? Đăng nhập ngay
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppLocalization.of(context)
                                .translate('AlreadyHaveAnAccount'),
                            style:
                                TextStyle(color: Color.fromRGBO(57, 57, 57, 1)),
                          ),
                          GestureDetector(
                            onTap: widget.onSwitch,
                            child: Text(
                              AppLocalization.of(context)
                                  .translate('SignInNow'),
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
