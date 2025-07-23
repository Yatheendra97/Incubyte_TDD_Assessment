import 'package:flutter_test/flutter_test.dart';
import '../string_calculator.dart';

void main() {
  group('String Calculator Tests', () {
    late StringCalculator calculator;

    setUp(() {
      calculator = StringCalculator();
    });

    test('should return 0 for empty string', () {
      expect(calculator.add(''), equals(0));
    });
  });
}