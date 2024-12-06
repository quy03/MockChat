import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mock_chat/contants.dart';
import '../../auth/auth_methods.dart';
import '../../components/my_button.dart';
import '../../components/my_textfield.dart';
import '../../helper/helper_fuction.dart';
import '../../localization/app_localization.dart';

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

  bool _isChecked = false;
  String? _checkboxError;

  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    fullnameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  String? _validateEmail(String email) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    if (!emailRegex.hasMatch(email)) {
      return AppLocalization.of(context).translate('InvalidEmail');
    }
    return null;
  }

  String? _validatePassword(String password) {
    final passwordRegex =
        RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d]{8,}$');
    if (!passwordRegex.hasMatch(password)) {
      return AppLocalization.of(context).translate('InvalidPassword');
    }
    return null;
  }

  Future<void> registerUser() async {
    setState(() {
      _checkboxError = _isChecked
          ? null
          : AppLocalization.of(context).translate('AgreeTermsError');
    });

    final emailError = _validateEmail(emailController.text);
    final passwordError = _validatePassword(passwordController.text);

    if (fullnameController.text.isEmpty) {
      displayMessageToUser(
        AppLocalization.of(context).translate('EnterFullName'),
        context,
      );
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

    if (_checkboxError != null) {
      displayMessageToUser(_checkboxError!, context);
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
                  child: RegisterForm(
                    fullnameController: fullnameController,
                    emailController: emailController,
                    passwordController: passwordController,
                    isChecked: _isChecked,
                    checkboxError: _checkboxError,
                    toggleCheckbox: () {
                      setState(() {
                        _isChecked = !_isChecked;
                        _checkboxError = null;
                      });
                    },
                    registerUser: registerUser,
                    onSwitch: widget.onSwitch,
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(height: size.height / 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppLocalization.of(context)
                                .translate('AlreadyHaveAnAccount'),
                            style: TextStyle(color: const Color(0xFF393939)),
                          ),
                          GestureDetector(
                            onTap: widget.onSwitch,
                            child: Text(
                              AppLocalization.of(context)
                                  .translate('SignInNow'),
                              style: TextStyle(
                                color: kSecondaryColor,
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

class RegisterForm extends StatelessWidget {
  final TextEditingController fullnameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool isChecked;
  final String? checkboxError;
  final VoidCallback toggleCheckbox;
  final VoidCallback registerUser;
  final VoidCallback onSwitch;

  const RegisterForm({
    super.key,
    required this.fullnameController,
    required this.emailController,
    required this.passwordController,
    required this.isChecked,
    required this.checkboxError,
    required this.toggleCheckbox,
    required this.registerUser,
    required this.onSwitch,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: size.height / 20),
        GestureDetector(
          onTap: onSwitch,
          child: SvgPicture.asset(
            "assets/icons/backward-arrow.svg",
            height: 24,
            width: 24,
          ),
        ),
        SizedBox(height: size.height / 20),
        Text(
          AppLocalization.of(context).translate('SignUp'),
          style: TextStyle(
            color: kSecondaryColor,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: size.height / 30),
        MyTextField(
          svgIcon: 'assets/icons/user.svg',
          labelText: AppLocalization.of(context).translate('FullName'),
          hintText: AppLocalization.of(context).translate('EnterYourFullName'),
          obscureText: false,
          controller: fullnameController,
        ),
        SizedBox(height: size.height / 30),
        MyTextField(
          svgIcon: 'assets/icons/mail.svg',
          labelText: 'EMAIL',
          hintText: AppLocalization.of(context).translate('EnterYourEmail'),
          obscureText: false,
          controller: emailController,
        ),
        SizedBox(height: size.height / 30),
        MyTextField(
          svgIcon: 'assets/icons/key.svg',
          labelText: AppLocalization.of(context).translate('Password'),
          hintText: AppLocalization.of(context).translate('EnterYourPassword'),
          obscureText: true,
          controller: passwordController,
        ),
        SizedBox(height: size.height / 30),
        Row(
          children: [
            GestureDetector(
              onTap: toggleCheckbox,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isChecked
                        ? Theme.of(context).colorScheme.secondary
                        : Colors.grey,
                    width: 2,
                  ),
                  color: isChecked
                      ? Theme.of(context).colorScheme.secondary
                      : Colors.transparent,
                ),
                child: isChecked
                    ? const Icon(
                        Icons.check,
                        size: 16,
                        color: Colors.white,
                      )
                    : null,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text:
                          "${AppLocalization.of(context).translate('IagreeToThe')} ",
                      style: const TextStyle(color: Color(0xFF393939)),
                    ),
                    TextSpan(
                      text:
                          "${AppLocalization.of(context).translate('Policies')} ",
                      style: TextStyle(
                        color: kSecondaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: "${AppLocalization.of(context).translate('And')} ",
                      style: const TextStyle(color: Color(0xFF393939)),
                    ),
                    TextSpan(
                      text: AppLocalization.of(context).translate('Terms'),
                      style: TextStyle(
                        color: kSecondaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        if (checkboxError != null)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              checkboxError!,
              style: const TextStyle(color: Colors.red),
            ),
          ),
        SizedBox(height: size.height / 20),
        MyButton(
          text: AppLocalization.of(context).translate('SignUp'),
          onTap: registerUser,
        ),
      ],
    );
  }
}
