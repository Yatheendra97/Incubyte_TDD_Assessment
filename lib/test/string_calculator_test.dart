import 'package:flutter_test/flutter_test.dart';
import '../string_calculator.dart';

void main() {
  group('String Calculator TDD Kata', () {
    late StringCalculator calculator;

    setUp(() {
      calculator = StringCalculator();
    });

    group('Step 1: Basic functionality', () {
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
    });

    group('Step 2: Handle any amount of numbers', () {
      test('should handle multiple comma-separated numbers', () {
        expect(calculator.add('1,2,3'), equals(6));
        expect(calculator.add('1,2,3,4,5'), equals(15));
        expect(calculator.add('10,20,30,40'), equals(100));
      });
    });

    group('Step 3: Handle newlines between numbers', () {
      test('should handle newlines as delimiters', () {
        expect(calculator.add('1\n2,3'), equals(6));
        expect(calculator.add('1\n2\n3'), equals(6));
        expect(calculator.add('4\n5,6\n7'), equals(22));
      });
    });

    group('Step 4: Support different delimiters', () {
      test('should support semicolon delimiter', () {
        expect(calculator.add('//;\n1;2'), equals(3));
        expect(calculator.add('//;\n1;2;3'), equals(6));
      });

      test('should support pipe delimiter', () {
        expect(calculator.add('//|\n1|2|3'), equals(6));
      });

      test('should support asterisk delimiter', () {
        expect(calculator.add('//*\n1*2*3'), equals(6));
      });

      test('should support custom delimiter with brackets', () {
        expect(calculator.add('//[;]\n1;2;3'), equals(6));
        expect(calculator.add('//[***]\n1***2***3'), equals(6));
      });
    });

    group('Step 5: Handle negative numbers', () {
      test('should throw exception for single negative number', () {
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

      test('should throw exception with custom delimiter and negative numbers', () {
        expect(
              () => calculator.add('//;\n1;-2;3;-4'),
          throwsA(predicate((e) =>
          e is ArgumentError &&
              e.message == 'negative numbers not allowed: -2, -4'
          )),
        );
      });
    });

    group('Extra: Numbers bigger than 1000 should be ignored', () {
      test('should ignore numbers greater than 1000', () {
        expect(calculator.add('2,1001'), equals(2));
        expect(calculator.add('1000,1001,2'), equals(1002));
        expect(calculator.add('//;\n1;1001;2000;3'), equals(4));
      });
    });

    group('Edge cases', () {
      test('should handle whitespace in numbers', () {
        expect(calculator.add(' 1 , 2 '), equals(3));
        expect(calculator.add('//;\n 1 ; 2 ; 3 '), equals(6));
      });

      test('should handle zero values', () {
        expect(calculator.add('0'), equals(0));
        expect(calculator.add('0,0'), equals(0));
        expect(calculator.add('1,0,2'), equals(3));
      });
    });
  });
}