import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/language_model.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageLoaded(Locale(Languages.languages[0].code))) {
    on<ToggleLanguageEvent>(_toggleLanguage);
  }

  _toggleLanguage(ToggleLanguageEvent event, Emitter<LanguageState> emit) {
    emit(LanguageLoaded(Locale(event.language.code)));
  }
}
