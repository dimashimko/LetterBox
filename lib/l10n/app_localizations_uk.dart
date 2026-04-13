// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get appTitle => 'Словесний Алфавіт';

  @override
  String get results => 'Результати';

  @override
  String get alphabetLanguageSection => 'Мова алфавіту';

  @override
  String get startLetterSection => 'Початкова літера';

  @override
  String get timerSection => 'Таймер';

  @override
  String get noTimer => 'Без таймера';

  @override
  String get timer1min => '1 хв';

  @override
  String get timer3min => '3 хв';

  @override
  String get timer5min => '5 хв';

  @override
  String get timer10min => '10 хв';

  @override
  String get multipleWordsTitle => 'Декілька слів на одну літеру';

  @override
  String get multipleWordsSubtitle =>
      'Найдовше — повні бали, додаткові — +1 бал';

  @override
  String get startGame => 'Почати гру';

  @override
  String get finishGameTooltip => 'Завершити гру';

  @override
  String wordHint(String startLetter) {
    return 'Слово на \"$startLetter\"...';
  }

  @override
  String bonusCount(int count) {
    return '+$count бонус';
  }

  @override
  String scorePoints(int score) {
    return '$score б.';
  }

  @override
  String get bonusPoint => '+1 б.';

  @override
  String get totalScore => 'Загальний рахунок';

  @override
  String lettersProgress(int filled, int total) {
    return '$filled/$total літер';
  }

  @override
  String get noWordsEntered => 'Жодного слова не введено';

  @override
  String gameAppBarTitle(String letter, int filled, int total, int score) {
    return 'Літера \"$letter\"  |  $filled/$total  |  $score б.';
  }

  @override
  String get errorGameFinished => 'Гру завершено';

  @override
  String get errorEmptyWord => 'Введіть слово';

  @override
  String errorWrongStart(String letter) {
    return 'Слово має починатися на \"$letter\"';
  }

  @override
  String get errorTooShort => 'Слово занадто коротке';

  @override
  String errorLetterNotInAlphabet(String letter) {
    return 'Літера \"$letter\" відсутня в алфавіті';
  }

  @override
  String get errorDuplicate => 'Це слово вже додано';

  @override
  String errorLongerExists(String word) {
    return 'Вже є довше слово (\"$word\")';
  }

  @override
  String get interfaceLanguageSection => 'Мова інтерфейсу';

  @override
  String get langUkrainian => 'Українська';

  @override
  String get langRussian => 'Російська';

  @override
  String get langEnglish => 'English';

  @override
  String get langUaRu => 'UA/RU';
}
