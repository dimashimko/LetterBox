// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Word Alphabet';

  @override
  String get results => 'Results';

  @override
  String get alphabetLanguageSection => 'Alphabet language';

  @override
  String get startLetterSection => 'Starting letter';

  @override
  String get timerSection => 'Timer';

  @override
  String get noTimer => 'No timer';

  @override
  String get timer1min => '1 min';

  @override
  String get timer3min => '3 min';

  @override
  String get timer5min => '5 min';

  @override
  String get timer10min => '10 min';

  @override
  String get multipleWordsTitle => 'Multiple words per letter';

  @override
  String get multipleWordsSubtitle =>
      'Longest gets full score, extras get +1 point';

  @override
  String get startGame => 'Start game';

  @override
  String get finishGameTooltip => 'Finish game';

  @override
  String wordHint(String startLetter) {
    return 'Word starting with \"$startLetter\"...';
  }

  @override
  String bonusCount(int count) {
    return '+$count bonus';
  }

  @override
  String scorePoints(int score) {
    return '$score pts';
  }

  @override
  String get bonusPoint => '+1 pt';

  @override
  String get totalScore => 'Total score';

  @override
  String lettersProgress(int filled, int total) {
    return '$filled/$total letters';
  }

  @override
  String get noWordsEntered => 'No words entered';

  @override
  String gameAppBarTitle(String letter, int filled, int total, int score) {
    return 'Letter \"$letter\"  |  $filled/$total  |  $score pts';
  }

  @override
  String get errorGameFinished => 'Game is over';

  @override
  String get errorEmptyWord => 'Enter a word';

  @override
  String errorWrongStart(String letter) {
    return 'Word must start with \"$letter\"';
  }

  @override
  String get errorTooShort => 'Word is too short';

  @override
  String errorLetterNotInAlphabet(String letter) {
    return 'Letter \"$letter\" is not in the alphabet';
  }

  @override
  String get errorDuplicate => 'This word was already added';

  @override
  String errorLongerExists(String word) {
    return 'A longer word already exists (\"$word\")';
  }

  @override
  String get interfaceLanguageSection => 'Interface language';

  @override
  String get langUkrainian => 'Ukrainian';

  @override
  String get langRussian => 'Russian';

  @override
  String get langEnglish => 'English';

  @override
  String get langUaRu => 'UA/RU';
}
