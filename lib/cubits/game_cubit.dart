import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letter_box/models/game_settings.dart';
import 'package:letter_box/models/letter_entry.dart';
import 'package:letter_box/cubits/game_state.dart';

class GameCubit extends Cubit<GameState> {
  Timer? _timer;

  GameCubit({required GameSettings settings})
      : super(_initialState(settings)) {
    if (settings.timerSeconds != null) {
      _startTimer();
    }
  }

  GameCubit.fromState(super.initialState);

  static GameState _initialState(GameSettings settings) {
    final alphabet = GameSettings.getAlphabet(settings.language);
    final entries = <String, LetterEntry>{};
    for (final letter in alphabet) {
      entries[letter] = LetterEntry(letter: letter);
    }
    return GameState(
      settings: settings,
      entries: entries,
      remainingSeconds: settings.timerSeconds ?? 0,
    );
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (state.remainingSeconds <= 1) {
        _timer?.cancel();
        emit(state.copyWith(
          remainingSeconds: 0,
          status: GameStatus.finished,
        ));
      } else {
        emit(state.copyWith(remainingSeconds: state.remainingSeconds - 1));
      }
    });
  }

  /// Returns error message or null on success.
  String? submitWord(String word) {
    if (state.status == GameStatus.finished) return 'Гру завершено';

    final trimmed = word.trim();
    if (trimmed.isEmpty) return 'Введіть слово';

    final upperWord = trimmed.toUpperCase();
    final startLetter = state.settings.startLetter.toUpperCase();

    if (!upperWord.startsWith(startLetter)) {
      return 'Слово має починатися на "$startLetter"';
    }

    if (upperWord.length < 2) return 'Слово занадто коротке';

    final lastChar = upperWord[upperWord.length - 1];

    if (!state.entries.containsKey(lastChar)) {
      return 'Літера "$lastChar" відсутня в алфавіті';
    }

    final currentEntry = state.entries[lastChar]!;

    if (currentEntry.bestWord?.toUpperCase() == upperWord) {
      return 'Це слово вже додано';
    }

    final newEntries = Map<String, LetterEntry>.from(state.entries);

    if (currentEntry.bestWord == null) {
      // No word yet — set as best.
      newEntries[lastChar] = currentEntry.copyWith(
        bestWord: () => trimmed,
      );
    } else if (state.settings.allowMultipleWords) {
      // Multiple words mode.
      if (trimmed.length > currentEntry.bestWord!.length) {
        // New word is longer — it becomes the best, old goes to bonus.
        final newBonus = List<String>.from(currentEntry.bonusWords)
          ..add(currentEntry.bestWord!);
        newEntries[lastChar] = currentEntry.copyWith(
          bestWord: () => trimmed,
          bonusWords: newBonus,
        );
      } else {
        // Shorter or equal — add as bonus.
        final newBonus = List<String>.from(currentEntry.bonusWords)
          ..add(trimmed);
        newEntries[lastChar] = currentEntry.copyWith(bonusWords: newBonus);
      }
    } else {
      // Single word mode — replace only if longer.
      if (trimmed.length > currentEntry.bestWord!.length) {
        newEntries[lastChar] = currentEntry.copyWith(
          bestWord: () => trimmed,
        );
      } else {
        return 'Вже є довше слово ("${currentEntry.bestWord}")';
      }
    }

    emit(state.copyWith(
      entries: newEntries,
      lastAddedLetter: () => lastChar,
    ));
    return null;
  }

  void removeWord(String letter, {String? bonusWord}) {
    final entry = state.entries[letter];
    if (entry == null) return;

    final newEntries = Map<String, LetterEntry>.from(state.entries);

    if (bonusWord != null) {
      final newBonus = List<String>.from(entry.bonusWords)..remove(bonusWord);
      newEntries[letter] = entry.copyWith(bonusWords: newBonus);
    } else {
      if (entry.bonusWords.isNotEmpty) {
        // Promote the longest bonus word to best.
        final sorted = List<String>.from(entry.bonusWords)
          ..sort((a, b) => b.length.compareTo(a.length));
        final newBest = sorted.removeAt(0);
        newEntries[letter] = entry.copyWith(
          bestWord: () => newBest,
          bonusWords: sorted,
        );
      } else {
        newEntries[letter] = entry.copyWith(
          bestWord: () => null,
          bonusWords: [],
        );
      }
    }

    emit(state.copyWith(entries: newEntries));
  }

  void finishGame() {
    _timer?.cancel();
    emit(state.copyWith(status: GameStatus.finished));
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
