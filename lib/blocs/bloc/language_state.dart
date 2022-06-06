part of 'language_bloc.dart';

abstract class LanguageState {}

class LanguageLoaded extends LanguageState {
  final Locale locale;

  LanguageLoaded(this.locale);
}
