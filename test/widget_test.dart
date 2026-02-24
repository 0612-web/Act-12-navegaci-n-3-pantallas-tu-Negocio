import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/main.dart';

void main() {
  testWidgets('Smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the LockScreen is shown initially.
    expect(find.byType(LockScreen), findsOneWidget);

    // Tap the screen to navigate to the home screen.
    await tester.tap(find.byType(LockScreen));
    await tester.pumpAndSettle(); // Wait for navigation to complete

    // Find the specific Google search bar container.
    final searchBarFinder = find.byWidgetPredicate((widget) {
      if (widget is Container && widget.decoration is BoxDecoration) {
        final decoration = widget.decoration as BoxDecoration;
        // Check for the unique properties of the search bar
        return decoration.color == Colors.white &&
               decoration.borderRadius == BorderRadius.circular(30);
      }
      return false;
    });

    // Verify that the search bar exists.
    expect(searchBarFinder, findsOneWidget);

    // Verify that the text "Google" is inside the search bar.
    expect(find.descendant(of: searchBarFinder, matching: find.text('Google')), findsOneWidget);
  });
}
