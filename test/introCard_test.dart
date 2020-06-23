// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:communique/landing/introCard/introCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('InfoInput', () {
    testWidgets('InfoInput validation works', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(IntroCard());

      // Verify that no validation errors are rendered 0.
      expect(find.text('Please enter your name.'), findsNothing);
      expect(find.text('Let them know where you are!'), findsNothing);

      // Tap the save icon and trigger a frame.
      await tester.tap(find.byIcon(Icons.check));
      await tester.pump();

      // Verify that our counter has incremented.
      expect(find.text('Please enter your name.'), findsOneWidget);
      expect(find.text('Let them know where you are!'), findsOneWidget);
    });
  });
}
