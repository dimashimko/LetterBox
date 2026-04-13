import 'package:letter_box/l10n/app_localizations.dart';
import 'package:letter_box/models/game_error.dart';

extension GameErrorLocalizer on GameErrorResult {
  String localize(AppLocalizations l10n) {
    switch (error) {
      case GameError.gameFinished:
        return l10n.errorGameFinished;
      case GameError.emptyWord:
        return l10n.errorEmptyWord;
      case GameError.wrongStart:
        return l10n.errorWrongStart(params['letter']!);
      case GameError.tooShort:
        return l10n.errorTooShort;
      case GameError.letterNotInAlphabet:
        return l10n.errorLetterNotInAlphabet(params['letter']!);
      case GameError.duplicate:
        return l10n.errorDuplicate;
      case GameError.longerExists:
        return l10n.errorLongerExists(params['word']!);
    }
  }
}
