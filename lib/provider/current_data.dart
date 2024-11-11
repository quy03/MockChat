import 'package:flutter/material.dart';

import '../helper/language_helper.dart';

class CurrentData with ChangeNotifier {
  String currentLanguage = "English"; // Giá trị mặc định cho currentLanguage
  Locale locale = const Locale('en', 'US'); // Giá trị mặc định cho locale

  final LanguageHelper languageHelper = LanguageHelper();

  Locale get getlocale => locale;

  void changLocale(String newLocale) {
    currentLanguage = newLocale;
    locale = languageHelper.converLangNameToLocale(newLocale);
    notifyListeners(); // Thông báo để cập nhật UI
  }

  String defineCurrentlanguage(BuildContext context) {
    if (currentLanguage.isNotEmpty) {
      return currentLanguage;
    } else {
      print("Locale from CurrentData: ${Localizations.localeOf(context)}");
      return languageHelper.convertLocaleToLangName(
        Localizations.localeOf(context).toString(),
      );
    }
  }
}
