/// String Calculator implementing TDD Kata requirements
///
/// Features:
/// - Handles empty strings (returns 0)
/// - Supports single and multiple numbers
/// - Supports comma and newline delimiters
/// - Supports custom delimiters (//delimiter\n)
/// - Throws exceptions for negative numbers
class StringCalculator {
  /// Adds numbers from a comma-separated string
  ///
  /// Returns 0 for empty string
  /// Supports newlines and custom delimiters
  /// Throws ArgumentError for negative numbers
  int add(String numbers) {
    if (numbers.isEmpty) {
      return 0;
    }

    String delimiter = ',';
    String numbersToProcess = numbers;

    // Parse custom delimiter if present
    if (numbers.startsWith('//')) {
      int delimiterEndIndex = numbers.indexOf('\n');
      if (delimiterEndIndex != -1) {
        delimiter = numbers.substring(2, delimiterEndIndex);
        numbersToProcess = numbers.substring(delimiterEndIndex + 1);
      }
    }

    // Normalize all delimiters to commas
    numbersToProcess = numbersToProcess
        .replaceAll('\n', ',')
        .replaceAll(delimiter, ',');

    // Parse numbers
    List<int> numbersList = numbersToProcess
        .split(',')
        .where((str) => str.isNotEmpty)
        .map((str) => int.parse(str.trim()))
        .toList();

    // Validate no negative numbers
    List<int> negatives = numbersList.where((n) => n < 0).toList();
    if (negatives.isNotEmpty) {
      throw ArgumentError('negative numbers not allowed: ${negatives.join(', ')}');
    }

    // Return sum
    return numbersList.fold(0, (sum, number) => sum + number);
  }
}