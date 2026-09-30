import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:codequest/main.dart';

void main() {
  testWidgets('CodeQuestApp loads and renders bottom navigation', (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});

    await tester.pumpWidget(
      const ProviderScope(
        child: CodeQuestApp(),
      ),
    );

    await tester.pump(const Duration(milliseconds: 300));

    // Verify Tab labels are displayed
    expect(find.text('Patika'), findsOneWidget);
    expect(find.text('Laboratuvar'), findsOneWidget);
    expect(find.text('Pratik'), findsOneWidget);
    expect(find.text('Liderlik'), findsOneWidget);
    expect(find.text('Profil'), findsOneWidget);

    // Verify Byte Mascot is present
    expect(find.text('Byte'), findsOneWidget);
  });
}
