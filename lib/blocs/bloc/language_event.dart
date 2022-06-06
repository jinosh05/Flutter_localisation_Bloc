part of 'language_bloc.dart';

@immutable
abstract class LanguageEvent {}

class ToggleLanguageEvent extends LanguageEvent {
  final LanguageEvent language;

  ToggleLanguageEvent(this.language);
}
