import 'package:equatable/equatable.dart';

enum AlphabetLanguage { ua, ru, en, uaRu }

class GameSettings extends Equatable {
  final String startLetter;
  final AlphabetLanguage language;
  final int? timerSeconds;
  final bool dictionaryCheck;
  final bool allowMultipleWords;

  const GameSettings({
    required this.startLetter,
    this.language = AlphabetLanguage.ua,
    this.timerSeconds,
    this.dictionaryCheck = false,
    this.allowMultipleWords = false,
  });

  static List<String> getAlphabet(AlphabetLanguage language) {
    switch (language) {
      case AlphabetLanguage.ua:
        return 'А Б В Г Ґ Д Е Є Ж З И І Ї Й К Л М Н О П Р С Т У Ф Х Ц Ч Ш Щ Ь Ю Я'
            .split(' ');
      case AlphabetLanguage.ru:
        return 'А Б В Г Д Е Ё Ж З И Й К Л М Н О П Р С Т У Ф Х Ц Ч Ш Щ Ъ Ы Ь Э Ю Я'
            .split(' ');
      case AlphabetLanguage.en:
        return 'A B C D E F G H I J K L M N O P Q R S T U V W X Y Z'.split(' ');
      case AlphabetLanguage.uaRu:
        final combined = <String>{
          ...'А Б В Г Ґ Д Е Є Ж З И І Ї Й К Л М Н О П Р С Т У Ф Х Ц Ч Ш Щ Ь Ю Я'
              .split(' '),
          ...'Ё Ъ Ы Э'.split(' '),
        };
        final sorted = combined.toList()..sort();
        return sorted;
    }
  }

  GameSettings copyWith({
    String? startLetter,
    AlphabetLanguage? language,
    int? Function()? timerSeconds,
    bool? dictionaryCheck,
    bool? allowMultipleWords,
  }) {
    return GameSettings(
      startLetter: startLetter ?? this.startLetter,
      language: language ?? this.language,
      timerSeconds: timerSeconds != null ? timerSeconds() : this.timerSeconds,
      dictionaryCheck: dictionaryCheck ?? this.dictionaryCheck,
      allowMultipleWords: allowMultipleWords ?? this.allowMultipleWords,
    );
  }

  @override
  List<Object?> get props => [
        startLetter,
        language,
        timerSeconds,
        dictionaryCheck,
        allowMultipleWords,
      ];
}
