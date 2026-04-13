import 'package:flutter/material.dart';

class TimerDisplay extends StatelessWidget {
  final int seconds;

  const TimerDisplay({super.key, required this.seconds});

  @override
  Widget build(BuildContext context) {
    final minutes = seconds ~/ 60;
    final secs = seconds % 60;
    final isLow = seconds <= 10 && seconds > 0;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isLow ? Colors.red.shade100 : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}',
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          fontFeatures: const [FontFeature.tabularFigures()],
          color: isLow ? Colors.red.shade700 : null,
        ),
      ),
    );
  }
}
