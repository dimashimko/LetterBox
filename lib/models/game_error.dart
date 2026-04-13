enum GameError {
  gameFinished,
  emptyWord,
  wrongStart,
  tooShort,
  letterNotInAlphabet,
  duplicate,
  longerExists,
}

class GameErrorResult {
  final GameError error;
  final Map<String, String> params;

  const GameErrorResult(this.error, [this.params = const {}]);
}
