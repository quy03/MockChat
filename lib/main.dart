import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mock_chat/auth/auth_page.dart';
import 'package:mock_chat/provider/friend_tab_provider.dart';
import 'package:mock_chat/provider/tab_provider.dart';
import 'package:mock_chat/provider/user_provider.dart';
import 'package:mock_chat/screens/body_change.dart';
import 'package:mock_chat/screens/friends/friend_screen.dart';
import 'package:mock_chat/screens/login_screen.dart';
import 'package:mock_chat/screens/message/message_screen.dart';
import 'package:mock_chat/screens/register_screen.dart';
import 'package:mock_chat/theme/theme.dart';
import 'core/app_localizations.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

import 'provider/color_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    EasyLocalization(
      supportedLocales: [
        AppLocalizations.engLocale,
        AppLocalizations.viLocale,
      ],
      path: AppLocalizations.translationFilePath,
      fallbackLocale: AppLocalizations.engLocale,
      startLocale: AppLocalizations.engLocale,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<ColorProvider>(create: (_) => ColorProvider()),
          ChangeNotifierProvider<TabProvider>(create: (_) => TabProvider()),
          ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
          ChangeNotifierProvider<FriendTabProvider>(
              create: (_) => FriendTabProvider()),
        ],
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme,
      home: const AuthPage(),
      routes: {
        // '/login_screen': (context) => const LoginScreen(),
        // '/register_screen': (context) => const RegisterScreen(),
        // '/message_screen': (context) => const MessageScreen(),
        // '/friend_screen': (context) => FriendScreen(),
        // '/body_change': (context) => const BodyChange(),
      },
    );
  }
}
