import 'package:equatable/equatable.dart';
import 'package:letter_box/models/game_settings.dart';

class SettingsState extends Equatable {
  final AlphabetLanguage language;
  final String startLetter;
  final int? timerSeconds;
  final bool dictionaryCheck;
  final bool allowMultipleWords;

  const SettingsState({
    this.language = AlphabetLanguage.ua,
    this.startLetter = 'Б',
    this.timerSeconds,
    this.dictionaryCheck = false,
    this.allowMultipleWords = false,
  });

  GameSettings toGameSettings() {
    return GameSettings(
      startLetter: startLetter,
      language: language,
      timerSeconds: timerSeconds,
      dictionaryCheck: dictionaryCheck,
      allowMultipleWords: allowMultipleWords,
    );
  }

  SettingsState copyWith({
    AlphabetLanguage? language,
    String? startLetter,
    int? Function()? timerSeconds,
    bool? dictionaryCheck,
    bool? allowMultipleWords,
  }) {
    return SettingsState(
      language: language ?? this.language,
      startLetter: startLetter ?? this.startLetter,
      timerSeconds: timerSeconds != null ? timerSeconds() : this.timerSeconds,
      dictionaryCheck: dictionaryCheck ?? this.dictionaryCheck,
      allowMultipleWords: allowMultipleWords ?? this.allowMultipleWords,
    );
  }

  @override
  List<Object?> get props => [
        language,
        startLetter,
        timerSeconds,
        dictionaryCheck,
        allowMultipleWords,
      ];
}
