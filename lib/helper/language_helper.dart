import 'dart:ui';

class LanguageHelper {
  converLangNameToLocale(String langNameToConvert) {
    Locale convertedLocale;

    switch (langNameToConvert) {
      case 'English':
        convertedLocale = const Locale('en', 'EN');
        break;

      case 'Tiếng Việt':
        convertedLocale = const Locale('vi', 'VI');
        break;

      default:
        convertedLocale = const Locale('en', 'EN');
    }
    return convertedLocale;
  }

  convertLocaleToLangName(String localeToConver) {
    String langName;

    switch (localeToConver) {
      case 'en':
        langName = "English";
        break;

      case 'vi':
        langName = "Tiếng Việt";
        break;

      default:
        langName = "English";
    }

    return langName;
  }
}
