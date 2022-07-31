import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/language_model.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc()
      : super(LanguageLoaded(LanguageEntity(
            code: Languages.languages[0].code,
            value: Languages.languages[0].value))) {
    on<ToggleLanguageEvent>(_toggleLanguage);
  }

  _toggleLanguage(ToggleLanguageEvent event, Emitter<LanguageState> emit) {
    emit(LanguageLoaded(LanguageEntity(
        code: event.language.code, value: event.language.value)));
  }
}
