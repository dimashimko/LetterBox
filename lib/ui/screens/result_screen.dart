import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letter_box/l10n/app_localizations.dart';
import 'package:letter_box/cubits/game_cubit.dart';
import 'package:letter_box/cubits/game_state.dart';
import 'package:letter_box/ui/widgets/result_letter_tile.dart';

class ResultScreen extends StatelessWidget {
  final GameState state;

  const ResultScreen({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GameCubit.fromState(state),
      child: const _ResultBody(),
    );
  }
}

class _ResultBody extends StatelessWidget {
  const _ResultBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameCubit, GameState>(
      builder: (context, state) {
        final cubit = context.read<GameCubit>();
        final l10n = AppLocalizations.of(context);
        final filled =
            state.entries.values.where((e) => e.bestWord != null).toList();

        return Scaffold(
          appBar: AppBar(
            title: Text(l10n.results),
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.home),
              onPressed: () =>
                  Navigator.of(context).popUntil((r) => r.isFirst),
            ),
          ),
          body: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                color: Theme.of(context)
                    .colorScheme
                    .primaryContainer
                    .withValues(alpha: 0.5),
                child: Column(
                  children: [
                    Text(
                      '${state.totalScore}',
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${l10n.totalScore}  |  '
                      '${l10n.lettersProgress(filled.length, state.totalLetters)}',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: filled.isEmpty
                    ? Center(
                        child: Text(
                          l10n.noWordsEntered,
                          style: const TextStyle(fontSize: 16),
                        ),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        itemCount: filled.length,
                        itemBuilder: (context, index) {
                          final entry = filled[index];
                          return ResultLetterTile(
                            entry: entry,
                            onRemoveBest: () =>
                                cubit.removeWord(entry.letter),
                            onRemoveBonus: (bonus) =>
                                cubit.removeWord(
                                  entry.letter,
                                  bonusWord: bonus,
                                ),
                          );
                        },
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
