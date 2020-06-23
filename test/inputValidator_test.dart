// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:communique/landing/business/inputValidator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('InputValidator', () {
    test('empty name test', () {
      String validationResult = InputValidator.validateName('');
      expect(validationResult, 'Please enter your name.');
    });
    test('empty location test', () {
      String validationResult = InputValidator.validateLocation('');
      expect(validationResult, 'Let them know where you are!');
    });
  });
}
