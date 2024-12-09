import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mock_chat/bloc/register/register_bloc.dart';
import 'package:mock_chat/bloc/register/register_event.dart';
import 'package:mock_chat/bloc/register/register_state.dart';
import 'package:mock_chat/components/my_button.dart';
import 'package:mock_chat/components/my_textfield.dart';
import 'package:mock_chat/contants.dart';
import 'package:mock_chat/helper/helper_fuction.dart';
import 'package:mock_chat/localization/app_localization.dart';
import 'package:mock_chat/provider/user_provider.dart';
import 'package:provider/provider.dart';

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
  bool _isChecked = false;
  String? _checkboxError;

  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  late RegisterBloc _registerBloc;

  @override
  void initState() {
    super.initState();
    _registerBloc = RegisterBloc();
  }

  void _toggleCheckbox() {
    setState(() {
      _isChecked = !_isChecked;
      _checkboxError = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryLightColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocProvider(
            create: (_) => _registerBloc,
            child: Container(
              height: size.height,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: BlocListener<RegisterBloc, RegisterState>(
                      listener: (context, state) {
                        if (state.registerStatus == RegisterStatus.error) {
                          displayMessageToUser(state.message, context);
                        } else if (state.registerStatus ==
                            RegisterStatus.success) {
                          Provider.of<UserProvider>(context, listen: false)
                              .refreshUser();
                          widget.onSwitch();
                        }
                      },
                      child: RegisterForm(
                        onSwitch: widget.onSwitch,
                        fullnameController: fullnameController,
                        emailController: emailController,
                        passwordController: passwordController,
                        isChecked: _isChecked,
                        checkboxError: _checkboxError,
                        toggleCheckbox: _toggleCheckbox,
                        onRegister: () {
                          context.read<RegisterBloc>().add(RegisterSubmitted());
                        },
                      ),
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
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  final TextEditingController fullnameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool isChecked;
  final String? checkboxError;
  final VoidCallback toggleCheckbox;
  final VoidCallback onRegister;
  final VoidCallback onSwitch;

  const RegisterForm({
    super.key,
    required this.fullnameController,
    required this.emailController,
    required this.passwordController,
    required this.isChecked,
    required this.checkboxError,
    required this.toggleCheckbox,
    required this.onRegister,
    required this.onSwitch,
  });

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
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
        Text(
          AppLocalization.of(context).translate('SignUp'),
          style: TextStyle(
            color: kSecondaryColor,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: size.height / 30),
        BlocBuilder<RegisterBloc, RegisterState>(
          buildWhen: (previous, current) =>
              current.fullname != previous.fullname,
          builder: (context, state) {
            return MyTextField(
              svgIcon: 'assets/icons/user.svg',
              labelText: AppLocalization.of(context).translate('FullName'),
              hintText:
                  AppLocalization.of(context).translate('EnterYourFullName'),
              obscureText: false,
              controller: widget.fullnameController,
              onChanged: (value) {
                context.read<RegisterBloc>().add(FullnameChanged(value));
              },
            );
          },
        ),
        SizedBox(height: size.height / 30),
        BlocBuilder<RegisterBloc, RegisterState>(
          buildWhen: (previous, current) => current.email != previous.email,
          builder: (context, state) {
            return MyTextField(
              svgIcon: 'assets/icons/mail.svg',
              labelText: 'EMAIL',
              hintText: AppLocalization.of(context).translate('EnterYourEmail'),
              obscureText: false,
              controller: widget.emailController,
              onChanged: (value) {
                context.read<RegisterBloc>().add(EmailChanged(value));
              },
            );
          },
        ),
        SizedBox(height: size.height / 30),
        BlocBuilder<RegisterBloc, RegisterState>(
          buildWhen: (previous, current) =>
              current.password != previous.password,
          builder: (context, state) {
            return MyTextField(
              svgIcon: 'assets/icons/key.svg',
              labelText: AppLocalization.of(context).translate('Password'),
              hintText:
                  AppLocalization.of(context).translate('EnterYourPassword'),
              obscureText: true,
              controller: widget.passwordController,
              onChanged: (value) {
                context.read<RegisterBloc>().add(PasswordChanged(value));
              },
            );
          },
        ),
        SizedBox(height: size.height / 30),
        Row(
          children: [
            GestureDetector(
              onTap: widget.toggleCheckbox,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: widget.isChecked
                        ? Theme.of(context).colorScheme.secondary
                        : Colors.grey,
                    width: 2,
                  ),
                  color: widget.isChecked
                      ? Theme.of(context).colorScheme.secondary
                      : Colors.transparent,
                ),
                child: widget.isChecked
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
        if (widget.checkboxError != null)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              widget.checkboxError!,
              style: const TextStyle(color: Colors.red),
            ),
          ),
        SizedBox(height: size.height / 20),
        BlocBuilder<RegisterBloc, RegisterState>(
          builder: (context, state) {
            if (state.registerStatus == RegisterStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }
            return MyButton(
              text: AppLocalization.of(context).translate('SignUp'),
              onTap: () {
                  context.read<RegisterBloc>().add(RegisterSubmitted());
              },
            );
          },
        ),
      ],
    );
  }
}
