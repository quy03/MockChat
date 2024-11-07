import 'package:flutter/material.dart';

import '../core/app_localizations.dart';

class LanguageProvider with ChangeNotifier {
  Locale _locale = AppLocalizations.engLocale;

  Locale get locale => _locale;

  void changeLanguage(String languageCode) {
    if (languageCode == 'vi') {
      _locale = AppLocalizations.viLocale;
    } else {
      _locale = AppLocalizations.engLocale;
    }
    notifyListeners();
  }
}
