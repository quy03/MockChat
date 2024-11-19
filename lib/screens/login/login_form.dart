import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mock_chat/bloc/Auth/login_bloc.dart';
import 'package:mock_chat/bloc/Auth/login_event.dart';
import 'package:mock_chat/bloc/Auth/login_state.dart';
import 'package:mock_chat/components/my_button.dart';
import 'package:mock_chat/components/my_textfield.dart';
import 'package:mock_chat/contants.dart';
import 'package:mock_chat/localization/app_localization.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onLogin;

  const LoginForm({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.onLogin,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: size.height / 12),
        Image.asset(
          "assets/images/logo_login.png",
          height: 124,
          width: 124,
        ),
        Text(
          AppLocalization.of(context).translate('Experience'),
          style: TextStyle(fontSize: 26),
        ),
        Text(
          AppLocalization.of(context).translate('Login'),
          style: TextStyle(
            color: kSecondaryColor,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: size.height / 60),
        BlocBuilder<LoginBloc, LoginState>(
          buildWhen: (current, previous) => current.email != previous.email,
          builder: (context, state) {
            return MyTextField(
              svgIcon: 'assets/icons/mail.svg',
              labelText: 'EMAIL',
              hintText: AppLocalization.of(context).translate('EnterYourEmail'),
              obscureText: false,
              controller: emailController,
              onChanged: (value) {
                context.read<LoginBloc>().add(EmailChanged(value));
              },
            );
          },
        ),
        SizedBox(height: size.height / 30),
        BlocBuilder<LoginBloc, LoginState>(
          buildWhen: (current, previous) =>
              current.password != previous.password,
          builder: (context, state) {
            return MyTextField(
              svgIcon: 'assets/icons/key.svg',
              labelText: AppLocalization.of(context).translate('Password'),
              hintText:
                  AppLocalization.of(context).translate('EnterYourPassword'),
              obscureText: true,
              controller: passwordController,
              onChanged: (value) {
                context.read<LoginBloc>().add(PasswordChanged(value));
              },
            );
          },
        ),
        SizedBox(height: size.height / 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              AppLocalization.of(context).translate('ForgotYourPassword'),
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: size.height / 20),
        BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if (state.loginStatus == LoginStatus.loading) {
              return Center(child: CircularProgressIndicator());
            }

            return MyButton(
                text: AppLocalization.of(context).translate('Login'),
                onTap: () {
                  context.read<LoginBloc>().add(LoginSubmitted());
                });
          },
        ),
      ],
    );
  }
}
