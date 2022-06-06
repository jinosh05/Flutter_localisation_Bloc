part of 'language_bloc.dart';

@immutable
abstract class LanguageEvent {}

class ToggleLanguageEvent extends LanguageEvent {
  final LanguageEntity language;

  ToggleLanguageEvent(this.language);
}
