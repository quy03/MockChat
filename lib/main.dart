import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'auth/auth_page.dart';
import 'core/app_localizations.dart';
import 'firebase_options.dart';
import 'provider/color_provider.dart';
import 'provider/friend_tab_provider.dart';
import 'provider/language_provider.dart';
import 'provider/tab_provider.dart';
import 'provider/user_provider.dart';
import 'theme/theme.dart';

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
    return ChangeNotifierProvider(
      create: (_) => LanguageProvider(),
      child: Consumer<LanguageProvider>(
        builder: (context, languageProvider, child) => MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: languageProvider.locale,
          debugShowCheckedModeBanner: false,
          theme: theme,
          title: 'Flutter Demo',
          home: const AuthPage(),
        ),
      ),
    );
  }
}
