part of 'language_bloc.dart';

@immutable
abstract class LanguageState {
  const LanguageState();
}

class LanguageLoaded extends LanguageState {
  final Locale locale;

  const LanguageLoaded(this.locale);
}
