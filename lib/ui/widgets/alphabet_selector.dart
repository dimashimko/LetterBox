import 'package:flutter/material.dart';

class AlphabetSelector extends StatelessWidget {
  final List<String> alphabet;
  final String selected;
  final ValueChanged<String> onSelected;

  const AlphabetSelector({
    super.key,
    required this.alphabet,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 6,
      runSpacing: 6,
      children: alphabet.map((letter) {
        final isSelected = letter == selected;
        return GestureDetector(
          onTap: () => onSelected(letter),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: isSelected
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: Text(
              letter,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isSelected
                    ? Theme.of(context).colorScheme.onPrimary
                    : Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
