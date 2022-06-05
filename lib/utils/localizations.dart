import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  AppLocalizations._init();

  static final AppLocalizations _instance = AppLocalizations._init();

  static AppLocalizations get instance => _instance;

  Map<dynamic, dynamic>? _localizedValues;

  Future<AppLocalizations> load(Locale locale) async {
    String jsonContent = await rootBundle
        .loadString("assets/locale/localization_${locale.languageCode}.json");
    _localizedValues = jsonDecode(jsonContent);
    return this;
  }

  String text(String key) {
    return _localizedValues![key] ?? "$key not found";
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  // Languages supported
  static const List<String> languages = ['en', 'ar'];
  @override
  bool isSupported(Locale locale) => languages.contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    return AppLocalizations.instance.load(locale);
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) =>
      true;
}
