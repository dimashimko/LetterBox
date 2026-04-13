import 'package:equatable/equatable.dart';

class LetterEntry extends Equatable {
  final String letter;
  final String? bestWord;
  final List<String> bonusWords;

  const LetterEntry({
    required this.letter,
    this.bestWord,
    this.bonusWords = const [],
  });

  int get score {
    if (bestWord == null) return 0;
    return bestWord!.length + bonusWords.length;
  }

  LetterEntry copyWith({
    String? letter,
    String? Function()? bestWord,
    List<String>? bonusWords,
  }) {
    return LetterEntry(
      letter: letter ?? this.letter,
      bestWord: bestWord != null ? bestWord() : this.bestWord,
      bonusWords: bonusWords ?? this.bonusWords,
    );
  }

  @override
  List<Object?> get props => [letter, bestWord, bonusWords];
}
