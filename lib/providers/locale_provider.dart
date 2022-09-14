import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../config/l10n/l10n.dart';

class LocaleProvider extends ChangeNotifier {
  bool isEnglish;

  LocaleProvider({required this.isEnglish});

  late Locale _locale = const Locale('en', '');

  Locale get locale => _locale;

/*
  bool checkLanguageIsArabic(){
    return _locale == const Locale('ar', '');
  }*/
  /*void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)|| locale==_locale) {//if local is same do nothing
      return;
    }
*/ /*
    toggleLocaleData();
*/ /*

    _locale = locale;
    notifyListeners();
  }*/
  void changeLanguage() async {
    print('here in locale');

    final settings = await Hive.openBox('settings');
    print(2);

    settings.put('isEnglish', !isEnglish);
    isEnglish = !isEnglish;
    notifyListeners();
  }

/*
  toggleLocaleData() async {
    final settings = await Hive.openBox('settings');

    settings.put('isEnglish', !isEnglish);

  }*/

  void clearLocale() {
    _locale = Locale('en', '');
    notifyListeners();
  }
}
