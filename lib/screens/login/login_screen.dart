import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mock_chat/bloc/login/login_bloc.dart';
import 'package:mock_chat/bloc/login/login_event.dart';
import 'package:mock_chat/bloc/login/login_state.dart';
import 'package:mock_chat/helper/helper_fuction.dart';
import 'package:mock_chat/localization/app_localization.dart';
import 'package:mock_chat/provider/user_provider.dart';
import 'package:mock_chat/screens/login/login_form.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  final Function onSwitch;

  const LoginScreen({super.key, required this.onSwitch});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  late LoginBloc _loginBloc;

  @override
  void initState() {
    super.initState();
    _loginBloc = LoginBloc();
  }

  @override
  void dispose() {
    _loginBloc.close();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocProvider(
            create: (_) => _loginBloc,
            child: Container(
              height: size.height,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: BlocListener<LoginBloc, LoginState>(
                      listener: (context, state) {
                        if (state.loginStatus == LoginStatus.error) {
                          displayMessageToUser(state.message, context);
                        } else if (state.loginStatus == LoginStatus.success) {
                          Provider.of<UserProvider>(context, listen: false)
                              .refreshUser();
                        }
                      },
                      child: Column(
                        children: [
                          LoginForm(
                            emailController: emailController,
                            passwordController: passwordController,
                            onLogin: () {
                              context.read<LoginBloc>().add(LoginSubmitted());
                            },
                          ),
                        ],
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
                                  .translate('DoNotHaveAnAccount'),
                              style: TextStyle(color: Colors.black87),
                            ),
                            GestureDetector(
                              onTap: () => widget.onSwitch(),
                              child: Text(
                                AppLocalization.of(context)
                                    .translate('SignUpNow'),
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
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
