import 'package:flutter/material.dart';
import 'package:letter_box/models/letter_entry.dart';

class ResultLetterTile extends StatelessWidget {
  final LetterEntry entry;
  final VoidCallback onRemoveBest;
  final ValueChanged<String> onRemoveBonus;

  const ResultLetterTile({
    super.key,
    required this.entry,
    required this.onRemoveBest,
    required this.onRemoveBonus,
  });

  @override
  Widget build(BuildContext context) {
    if (entry.bestWord == null) return const SizedBox.shrink();

    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorScheme.secondaryContainer.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: colorScheme.secondary.withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: colorScheme.secondary,
                  borderRadius: BorderRadius.circular(6),
                ),
                alignment: Alignment.center,
                child: Text(
                  entry.letter,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSecondary,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  entry.bestWord!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                '${entry.bestWord!.length} б.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.primary,
                ),
              ),
              IconButton(
                icon: Icon(Icons.delete_outline, color: colorScheme.error),
                onPressed: onRemoveBest,
                visualDensity: VisualDensity.compact,
              ),
            ],
          ),
          for (final bonus in entry.bonusWords)
            Padding(
              padding: const EdgeInsets.only(left: 44, top: 4),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      bonus,
                      style: TextStyle(
                        fontSize: 14,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                  Text(
                    '+1 б.',
                    style: TextStyle(
                      fontSize: 12,
                      color: colorScheme.tertiary,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.remove_circle_outline,
                      size: 20,
                      color: colorScheme.error.withValues(alpha: 0.7),
                    ),
                    onPressed: () => onRemoveBonus(bonus),
                    visualDensity: VisualDensity.compact,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
