import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mock_chat/auth/login_or_register.dart';
import 'package:mock_chat/screens/login_screen.dart';
import 'package:mock_chat/screens/message/message_screen.dart';
import 'package:mock_chat/screens/register_screen.dart';
import 'package:mock_chat/theme/theme.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme,
      home: const LoginOrRegister(),
      routes: {
        '/login_screen': (context) => const LoginScreen(),
        '/register_screen': (context) => const RegisterScreen(),
        '/message_screen': (context) => const MessageScreen(),
      },
    );
  }
}
