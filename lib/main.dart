import 'package:flutter/material.dart';
import 'package:letter_box/l10n/app_localizations.dart';
import 'package:letter_box/ui/screens/settings_screen.dart';

void main() {
  runApp(const LetterBoxApp());
}

class LetterBoxApp extends StatelessWidget {
  const LetterBoxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Letter Box',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
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
