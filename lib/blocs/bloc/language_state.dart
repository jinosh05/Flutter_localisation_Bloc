part of 'language_bloc.dart';

@immutable
abstract class LanguageState {
  final LanguageEntity locale;
  const LanguageState(this.locale);
}

class LanguageLoaded extends LanguageState {
  const LanguageLoaded(super.locale);
}
