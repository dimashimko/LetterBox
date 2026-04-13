import 'package:flutter/material.dart';
import 'package:letter_box/l10n/app_localizations.dart';
import 'package:letter_box/models/letter_entry.dart';

class LetterTile extends StatelessWidget {
  final LetterEntry entry;
  final String startLetter;
  final bool highlighted;

  const LetterTile({
    super.key,
    required this.entry,
    required this.startLetter,
    this.highlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    final hasWord = entry.bestWord != null;
    final colorScheme = Theme.of(context).colorScheme;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: highlighted
            ? colorScheme.primaryContainer
            : hasWord
                ? colorScheme.secondaryContainer.withValues(alpha: 0.5)
                : colorScheme.surface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: hasWord
              ? colorScheme.secondary.withValues(alpha: 0.3)
              : colorScheme.outlineVariant.withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: hasWord ? colorScheme.secondary : colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: Text(
              entry.letter,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: hasWord
                    ? colorScheme.onSecondary
                    : colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  hasWord
                      ? '$startLetter...${entry.letter}  ${entry.bestWord}'
                      : '$startLetter...${entry.letter}',
                  style: TextStyle(
                    fontSize: 15,
                    color: hasWord ? null : colorScheme.onSurfaceVariant,
                  ),
                ),
                if (entry.bonusWords.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(
                      AppLocalizations.of(context).bonusCount(entry.bonusWords.length),
                      style: TextStyle(
                        fontSize: 12,
                        color: colorScheme.tertiary,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Text(
            '${entry.score}',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: hasWord ? colorScheme.primary : colorScheme.outlineVariant,
            ),
          ),
        ],
      ),
    );
  }
}
