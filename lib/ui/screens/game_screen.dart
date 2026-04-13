import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letter_box/l10n/app_localizations.dart';
import 'package:letter_box/cubits/game_cubit.dart';
import 'package:letter_box/cubits/game_state.dart';
import 'package:letter_box/models/game_settings.dart';
import 'package:letter_box/ui/helpers/game_error_localizer.dart';
import 'package:letter_box/ui/widgets/letter_tile.dart';
import 'package:letter_box/ui/widgets/timer_display.dart';
import 'package:letter_box/ui/widgets/word_input_field.dart';
import 'package:letter_box/ui/screens/result_screen.dart';

class GameScreen extends StatelessWidget {
  final GameSettings settings;

  const GameScreen({super.key, required this.settings});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GameCubit(settings: settings),
      child: const _GameBody(),
    );
  }
}

class _GameBody extends StatelessWidget {
  const _GameBody();

  @override
  Widget build(BuildContext context) {
    return BlocListener<GameCubit, GameState>(
      listenWhen: (prev, curr) =>
          prev.status != curr.status && curr.status == GameStatus.finished,
      listener: (context, state) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute<void>(
            builder: (_) => ResultScreen(state: state),
          ),
        );
      },
      child: BlocBuilder<GameCubit, GameState>(
        builder: (context, state) {
          final cubit = context.read<GameCubit>();
          final l10n = AppLocalizations.of(context);
          final entries = state.entries.values.toList();

          return Scaffold(
            appBar: AppBar(
              title: Text(
                l10n.gameAppBarTitle(
                  state.settings.startLetter,
                  state.filledCount,
                  state.totalLetters,
                  state.totalScore,
                ),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  icon: const Icon(Icons.stop_circle_outlined),
                  tooltip: l10n.finishGameTooltip,
                  onPressed: () => cubit.finishGame(),
                ),
              ],
            ),
            body: Column(
              children: [
                if (state.settings.timerSeconds != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: TimerDisplay(seconds: state.remainingSeconds),
                  ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    itemCount: entries.length,
                    itemBuilder: (context, index) {
                      final entry = entries[index];
                      return LetterTile(
                        entry: entry,
                        startLetter: state.settings.startLetter,
                        highlighted:
                            state.lastAddedLetter == entry.letter,
                      );
                    },
                  ),
                ),
                WordInputField(
                  startLetter: state.settings.startLetter,
                  onSubmit: (word) {
                    final error = cubit.submitWord(word);
                    if (error != null) {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          SnackBar(
                            content: Text(error.localize(l10n)),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
