import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mock_chat/auth/auth_page.dart';
import 'package:mock_chat/provider/color_provider.dart';
import 'package:mock_chat/provider/tab_provider.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'localization/app_localization.dart';
import 'provider/current_data.dart';
import 'provider/user_provider.dart';
import 'theme/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Kích hoạt chế độ offline cho Realtime Database
  FirebaseDatabase.instance.setPersistenceEnabled(true);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ColorProvider>(create: (_) => ColorProvider()),
        ChangeNotifierProvider<TabProvider>(create: (_) => TabProvider()),
        ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
        ChangeNotifierProvider<CurrentData>(create: (_) => CurrentData()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CurrentData>(
      builder: (BuildContext context, CurrentData provider, Widget? child) =>
          MaterialApp(
        locale: provider.locale,
        localizationsDelegates: const [
          AppLocalizationDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'),
          Locale('vi'),
        ],
        debugShowCheckedModeBanner: false,
        theme: theme,
        title: 'Mock Chat',
        home: const AuthPage(),
      ),
    );
  }
}
