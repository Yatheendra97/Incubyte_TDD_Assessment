import 'package:flutter_test/flutter_test.dart';
import '../string_calculator.dart';

void main() {
  group('String Calculator TDD Kata', () {
    late StringCalculator calculator;

    setUp(() {
      calculator = StringCalculator();
    });

    group('Basic Requirements', () {
      test('should return 0 for empty string', () {
        expect(calculator.add(''), equals(0));
      });

      test('should return the number itself for single number', () {
        expect(calculator.add('1'), equals(1));
        expect(calculator.add('5'), equals(5));
      });

      test('should return sum for two comma-separated numbers', () {
        expect(calculator.add('1,5'), equals(6));
        expect(calculator.add('2,3'), equals(5));
      });

      test('should handle multiple comma-separated numbers', () {
        expect(calculator.add('1,2,3'), equals(6));
        expect(calculator.add('1,2,3,4,5'), equals(15));
      });

      test('should handle newlines as delimiters', () {
        expect(calculator.add('1\n2,3'), equals(6));
        expect(calculator.add('1\n2\n3'), equals(6));
      });

      test('should support custom delimiters', () {
        expect(calculator.add('//;\n1;2'), equals(3));
        expect(calculator.add('//|\n1|2|3'), equals(6));
        expect(calculator.add('//*\n1*2*3'), equals(6));
      });

      test('should throw exception for negative numbers', () {
        expect(
              () => calculator.add('-1'),
          throwsA(predicate((e) =>
          e is ArgumentError &&
              e.message == 'negative numbers not allowed: -1'
          )),
        );
      });

      test('should throw exception for multiple negative numbers', () {
        expect(
              () => calculator.add('1,-2,-3,4'),
          throwsA(predicate((e) =>
          e is ArgumentError &&
              e.message == 'negative numbers not allowed: -2, -3'
          )),
        );
      });
    });

    group('Edge Cases', () {
      test('should handle zero values', () {
        expect(calculator.add('0'), equals(0));
        expect(calculator.add('0,0'), equals(0));
        expect(calculator.add('1,0,2'), equals(3));
      });

      test('should handle custom delimiter with negatives', () {
        expect(
              () => calculator.add('//;\n1;-2;3'),
          throwsA(predicate((e) =>
          e is ArgumentError &&
              e.message == 'negative numbers not allowed: -2'
          )),
        );
      });
    });
  });
}