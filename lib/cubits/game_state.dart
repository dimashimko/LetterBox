import 'package:equatable/equatable.dart';
import 'package:letter_box/models/letter_entry.dart';
import 'package:letter_box/models/game_settings.dart';

enum GameStatus { playing, finished }

class GameState extends Equatable {
  final GameSettings settings;
  final Map<String, LetterEntry> entries;
  final int remainingSeconds;
  final GameStatus status;
  final String? lastAddedLetter;

  const GameState({
    required this.settings,
    required this.entries,
    required this.remainingSeconds,
    this.status = GameStatus.playing,
    this.lastAddedLetter,
  });

  int get totalScore =>
      entries.values.fold(0, (sum, entry) => sum + entry.score);

  int get filledCount =>
      entries.values.where((e) => e.bestWord != null).length;

  int get totalLetters => entries.length;

  GameState copyWith({
    GameSettings? settings,
    Map<String, LetterEntry>? entries,
    int? remainingSeconds,
    GameStatus? status,
    String? Function()? lastAddedLetter,
  }) {
    return GameState(
      settings: settings ?? this.settings,
      entries: entries ?? this.entries,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      status: status ?? this.status,
      lastAddedLetter:
          lastAddedLetter != null ? lastAddedLetter() : this.lastAddedLetter,
    );
  }

  @override
  List<Object?> get props => [
        settings,
        entries,
        remainingSeconds,
        status,
        lastAddedLetter,
      ];
}
