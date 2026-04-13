import 'package:flutter/material.dart';
import 'package:letter_box/ui/screens/settings_screen.dart';

void main() {
  runApp(const LetterBoxApp());
}

class LetterBoxApp extends StatelessWidget {
  const LetterBoxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Словесний Алфавіт',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const SettingsScreen(),
    );
  }
}
