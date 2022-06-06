import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/language_model.dart';
import '../models/locale_model.dart';

class AppLocalizations {
  AppLocalizations._init();

  static final AppLocalizations _instance = AppLocalizations._init();

  static AppLocalizations get instance => _instance;

  Map<dynamic, dynamic>? _localizedValues;
  String jsonContent = '';

  Future<AppLocalizations> load(Locale locale) async {
    jsonContent = await rootBundle
        .loadString("assets/locale/localization_${locale.languageCode}.json");
    _localizedValues = jsonDecode(jsonContent);
    return this;
  }

  String text(String key) {
    return _localizedValues![key] ?? "$key not found";
  }

  LocaleModel value() {
    return LocaleModel.fromJson(jsonDecode(jsonContent));
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  static const List<String> languages = ['en', 'ar'];
  @override
  bool isSupported(Locale locale) => Languages.languages
      .map((e) => e.code)
      .toList()
      .contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    return AppLocalizations.instance.load(locale);
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) =>
      true;
}
