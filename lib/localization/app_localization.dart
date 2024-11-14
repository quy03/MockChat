import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mock_chat/localization/en.dart';
import 'package:mock_chat/localization/vi.dart';

class AppLocalization {
  AppLocalization(this.locale);

  Locale locale;

  static AppLocalization? of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  static final Map<String, Map<String, String>> _localizedValue = {
    'en': en,
    'vi': vi,
  };

  String translate(String key) {
    return _localizedValue[locale.languageCode]![key] ?? '**$key not foud';
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'vi'].contains(locale.languageCode);

  @override
  Future<AppLocalization> load(Locale locale) {
    return SynchronousFuture<AppLocalization>(
      AppLocalization(locale),
    );
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalization> old) =>
      false;
}
