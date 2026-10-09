import 'package:flutter_test/flutter_test.dart';
import 'package:hotelmanu/main.dart';

void main() {
  testWidgets('Restaurant menu loads smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that title and products are displayed.
    expect(find.text('Restaurant Menu'), findsOneWidget);
    expect(find.text('Burger'), findsOneWidget);
  });
}
