import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mock_chat/auth/login_or_register.dart';
import 'package:mock_chat/screens/body_change.dart';
import 'package:provider/provider.dart';

import '../provider/tab_provider.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TabProvider(),
      child: Scaffold(
        body: StreamBuilder(
          // theo dõi trạng thái đăng nhập
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Provider.of<TabProvider>(context, listen: false).resetIndex();
              });
              return BodyChange();
            } else {
              return LoginOrRegister();
            }
          },
        ),
      ),
    );
  }
}
