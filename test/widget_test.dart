import 'package:flutter_test/flutter_test.dart';

import 'package:final_teo/main.dart';

void main() {
  testWidgets('Muestra la pantalla de inicio real', (WidgetTester tester) async {
    await tester.pumpWidget(const FilosofiaApp());

    expect(find.text('FINAL TEOLOGÍA'), findsOneWidget);
    expect(find.text('Test por Temas'), findsOneWidget);
    expect(find.text('Simulacro de Examen'), findsOneWidget);
  });
}
