import 'package:flutter_test/flutter_test.dart';
import 'package:letter_box/main.dart';

void main() {
  testWidgets('App starts and shows settings screen', (tester) async {
    await tester.pumpWidget(const LetterBoxApp());
    expect(find.text('Словесний Алфавіт'), findsOneWidget);
    expect(find.text('Почати гру'), findsOneWidget);
  });
}
