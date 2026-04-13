import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letter_box/models/game_settings.dart';
import 'package:letter_box/cubits/settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(const SettingsState());

  void setLanguage(AlphabetLanguage language) {
    final alphabet = GameSettings.getAlphabet(language);
    final currentStillValid = alphabet.contains(state.startLetter);
    emit(state.copyWith(
      language: language,
      startLetter: currentStillValid ? null : alphabet.first,
    ));
  }

  void setStartLetter(String letter) {
    emit(state.copyWith(startLetter: letter));
  }

  void setTimer(int? seconds) {
    emit(state.copyWith(timerSeconds: () => seconds));
  }

  void toggleDictionaryCheck() {
    emit(state.copyWith(dictionaryCheck: !state.dictionaryCheck));
  }

  void toggleMultipleWords() {
    emit(state.copyWith(allowMultipleWords: !state.allowMultipleWords));
  }
}
