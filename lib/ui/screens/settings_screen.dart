import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letter_box/l10n/app_localizations.dart';
import 'package:letter_box/cubits/settings_cubit.dart';
import 'package:letter_box/cubits/settings_state.dart';
import 'package:letter_box/models/game_settings.dart';
import 'package:letter_box/ui/widgets/alphabet_selector.dart';
import 'package:letter_box/ui/screens/game_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SettingsCubit(),
      child: const _SettingsBody(),
    );
  }
}

class _SettingsBody extends StatelessWidget {
  const _SettingsBody();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appTitle),
        centerTitle: true,
      ),
      body: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          final cubit = context.read<SettingsCubit>();
          final alphabet = GameSettings.getAlphabet(state.language);

          String languageLabel(AlphabetLanguage lang) {
            switch (lang) {
              case AlphabetLanguage.ua:
                return l10n.langUkrainian;
              case AlphabetLanguage.ru:
                return l10n.langRussian;
              case AlphabetLanguage.en:
                return l10n.langEnglish;
              case AlphabetLanguage.uaRu:
                return l10n.langUaRu;
            }
          }

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _SectionTitle(title: l10n.alphabetLanguageSection),
              const SizedBox(height: 8),
              SegmentedButton<AlphabetLanguage>(
                segments: AlphabetLanguage.values
                    .map((lang) => ButtonSegment(
                          value: lang,
                          label: Text(languageLabel(lang)),
                        ))
                    .toList(),
                selected: {state.language},
                onSelectionChanged: (s) => cubit.setLanguage(s.first),
              ),
              const SizedBox(height: 24),
              _SectionTitle(title: l10n.startLetterSection),
              const SizedBox(height: 8),
              AlphabetSelector(
                alphabet: alphabet,
                selected: state.startLetter,
                onSelected: cubit.setStartLetter,
              ),
              const SizedBox(height: 24),
              _SectionTitle(title: l10n.timerSection),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: [
                  _TimerChip(
                    label: l10n.noTimer,
                    selected: state.timerSeconds == null,
                    onTap: () => cubit.setTimer(null),
                  ),
                  _TimerChip(
                    label: l10n.timer1min,
                    selected: state.timerSeconds == 60,
                    onTap: () => cubit.setTimer(60),
                  ),
                  _TimerChip(
                    label: l10n.timer3min,
                    selected: state.timerSeconds == 180,
                    onTap: () => cubit.setTimer(180),
                  ),
                  _TimerChip(
                    label: l10n.timer5min,
                    selected: state.timerSeconds == 300,
                    onTap: () => cubit.setTimer(300),
                  ),
                  _TimerChip(
                    label: l10n.timer10min,
                    selected: state.timerSeconds == 600,
                    onTap: () => cubit.setTimer(600),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              SwitchListTile(
                title: Text(l10n.multipleWordsTitle),
                subtitle: Text(l10n.multipleWordsSubtitle),
                value: state.allowMultipleWords,
                onChanged: (_) => cubit.toggleMultipleWords(),
              ),
              const SizedBox(height: 40),
              FilledButton.icon(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (_) =>
                          GameScreen(settings: state.toGameSettings()),
                    ),
                  );
                },
                icon: const Icon(Icons.play_arrow),
                label: Text(
                  l10n.startGame,
                  style: const TextStyle(fontSize: 18),
                ),
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
    );
  }
}

class _TimerChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _TimerChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(label),
      selected: selected,
      onSelected: (_) => onTap(),
    );
  }
}
