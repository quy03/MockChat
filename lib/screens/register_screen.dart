import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../components/my_button.dart';
import '../components/my_textfield.dart';
import '../helper/helper_fuction.dart';

class RegisterScreen extends StatefulWidget {
  final Function()? press;
  const RegisterScreen({super.key, this.press});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // kiểm tra nút checkbox
  bool _isChecked = false;
  String? checkBox;

  // text controllers / kiểm soát và quản lý nội dung của trường nhập dữ liệu
  TextEditingController fullnameController = TextEditingController();
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

  // Hàm đăng ký người dùng
  Future<void> registerUser() async {
    // Kiểm tra tính hợp lệ của email và mật khẩu
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

    // Kiểm tra trạng thái checkbox
    if (!_isChecked) {
      setState(() {
        checkBox = "Bạn phải đồng ý với chính sách và điều khoản";
      });
      displayMessageToUser(checkBox!, context);

      return;
    } else {
      setState(() {
        checkBox = null; // Xóa thông báo lỗi nếu checkbox đã được chọn
      });
    }

    // Hiển thị vòng tròn loading khi đăng ký
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      // Đăng ký với Firebase
      // ignore: unused_local_variable
      UserCredential? userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // Tắt loading
      // ignore: use_build_context_synchronously
      Navigator.pop(context);

      // ignore: use_build_context_synchronously
      displayMessageToUser('Đăng ký thành công', context);
    } on FirebaseAuthException catch (e) {
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
                      SizedBox(height: size.height / 20),
                      GestureDetector(
                        onTap: widget.press,
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
                      MyTextField(
                        svgIcon: 'assets/icons/user.svg',
                        labelText: 'HỌ VÀ TÊN',
                        hintText: 'Nhập họ và tên của bạn',
                        obscureText: false,
                        controller: fullnameController,
                      ),
                      SizedBox(height: size.height / 30),

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
                                const TextSpan(
                                  text: "Tôi đồng ý với ",
                                  style: TextStyle(
                                      color: Color.fromRGBO(57, 57, 57, 1)),
                                ),
                                TextSpan(
                                  text: "chính sách",
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const TextSpan(
                                  text: ' và ',
                                  style: TextStyle(
                                      color: Color.fromRGBO(57, 57, 57, 1)),
                                ),
                                TextSpan(
                                  text: 'điều khoản',
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
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      // nút đăng ký
                      MyButton(
                        text: 'ĐĂNG KÝ',
                        onTap: registerUser,
                      ),
                      SizedBox(height: size.height / 10),

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
                            onTap: widget.press,
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
      ),
    );
  }
}
