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

    test('should return the number itself for single number', () {
      expect(calculator.add('1'), equals(1));
      expect(calculator.add('5'), equals(5));
    });


  });
}