import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_uk.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('uk'),
    Locale('en'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In uk, this message translates to:
  /// **'Словесний Алфавіт'**
  String get appTitle;

  /// No description provided for @results.
  ///
  /// In uk, this message translates to:
  /// **'Результати'**
  String get results;

  /// No description provided for @alphabetLanguageSection.
  ///
  /// In uk, this message translates to:
  /// **'Мова алфавіту'**
  String get alphabetLanguageSection;

  /// No description provided for @startLetterSection.
  ///
  /// In uk, this message translates to:
  /// **'Початкова літера'**
  String get startLetterSection;

  /// No description provided for @timerSection.
  ///
  /// In uk, this message translates to:
  /// **'Таймер'**
  String get timerSection;

  /// No description provided for @noTimer.
  ///
  /// In uk, this message translates to:
  /// **'Без таймера'**
  String get noTimer;

  /// No description provided for @timer1min.
  ///
  /// In uk, this message translates to:
  /// **'1 хв'**
  String get timer1min;

  /// No description provided for @timer3min.
  ///
  /// In uk, this message translates to:
  /// **'3 хв'**
  String get timer3min;

  /// No description provided for @timer5min.
  ///
  /// In uk, this message translates to:
  /// **'5 хв'**
  String get timer5min;

  /// No description provided for @timer10min.
  ///
  /// In uk, this message translates to:
  /// **'10 хв'**
  String get timer10min;

  /// No description provided for @multipleWordsTitle.
  ///
  /// In uk, this message translates to:
  /// **'Декілька слів на одну літеру'**
  String get multipleWordsTitle;

  /// No description provided for @multipleWordsSubtitle.
  ///
  /// In uk, this message translates to:
  /// **'Найдовше — повні бали, додаткові — +1 бал'**
  String get multipleWordsSubtitle;

  /// No description provided for @startGame.
  ///
  /// In uk, this message translates to:
  /// **'Почати гру'**
  String get startGame;

  /// No description provided for @finishGameTooltip.
  ///
  /// In uk, this message translates to:
  /// **'Завершити гру'**
  String get finishGameTooltip;

  /// No description provided for @wordHint.
  ///
  /// In uk, this message translates to:
  /// **'Слово на \"{startLetter}\"...'**
  String wordHint(String startLetter);

  /// No description provided for @bonusCount.
  ///
  /// In uk, this message translates to:
  /// **'+{count} бонус'**
  String bonusCount(int count);

  /// No description provided for @scorePoints.
  ///
  /// In uk, this message translates to:
  /// **'{score} б.'**
  String scorePoints(int score);

  /// No description provided for @bonusPoint.
  ///
  /// In uk, this message translates to:
  /// **'+1 б.'**
  String get bonusPoint;

  /// No description provided for @totalScore.
  ///
  /// In uk, this message translates to:
  /// **'Загальний рахунок'**
  String get totalScore;

  /// No description provided for @lettersProgress.
  ///
  /// In uk, this message translates to:
  /// **'{filled}/{total} літер'**
  String lettersProgress(int filled, int total);

  /// No description provided for @noWordsEntered.
  ///
  /// In uk, this message translates to:
  /// **'Жодного слова не введено'**
  String get noWordsEntered;

  /// No description provided for @gameAppBarTitle.
  ///
  /// In uk, this message translates to:
  /// **'Літера \"{letter}\"  |  {filled}/{total}  |  {score} б.'**
  String gameAppBarTitle(String letter, int filled, int total, int score);

  /// No description provided for @errorGameFinished.
  ///
  /// In uk, this message translates to:
  /// **'Гру завершено'**
  String get errorGameFinished;

  /// No description provided for @errorEmptyWord.
  ///
  /// In uk, this message translates to:
  /// **'Введіть слово'**
  String get errorEmptyWord;

  /// No description provided for @errorWrongStart.
  ///
  /// In uk, this message translates to:
  /// **'Слово має починатися на \"{letter}\"'**
  String errorWrongStart(String letter);

  /// No description provided for @errorTooShort.
  ///
  /// In uk, this message translates to:
  /// **'Слово занадто коротке'**
  String get errorTooShort;

  /// No description provided for @errorLetterNotInAlphabet.
  ///
  /// In uk, this message translates to:
  /// **'Літера \"{letter}\" відсутня в алфавіті'**
  String errorLetterNotInAlphabet(String letter);

  /// No description provided for @errorDuplicate.
  ///
  /// In uk, this message translates to:
  /// **'Це слово вже додано'**
  String get errorDuplicate;

  /// No description provided for @errorLongerExists.
  ///
  /// In uk, this message translates to:
  /// **'Вже є довше слово (\"{word}\")'**
  String errorLongerExists(String word);

  /// No description provided for @interfaceLanguageSection.
  ///
  /// In uk, this message translates to:
  /// **'Мова інтерфейсу'**
  String get interfaceLanguageSection;

  /// No description provided for @langUkrainian.
  ///
  /// In uk, this message translates to:
  /// **'Українська'**
  String get langUkrainian;

  /// No description provided for @langRussian.
  ///
  /// In uk, this message translates to:
  /// **'Російська'**
  String get langRussian;

  /// No description provided for @langEnglish.
  ///
  /// In uk, this message translates to:
  /// **'English'**
  String get langEnglish;

  /// No description provided for @langUaRu.
  ///
  /// In uk, this message translates to:
  /// **'UA/RU'**
  String get langUaRu;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'uk'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'uk':
      return AppLocalizationsUk();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
