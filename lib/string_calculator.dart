class StringCalculator {
  /// Adds numbers from a string input
  ///
  /// Input: a string of comma-separated numbers
  /// Output: an integer, sum of the numbers
  ///
  /// Examples:
  /// - Input: "", Output: 0
  /// - Input: "1", Output: 1
  /// - Input: "1,5", Output: 6
  int add(String numbers) {
    // Step 1: Handle empty string
    if (numbers.isEmpty) {
      return 0;
    }

    // Step 4: Handle custom delimiters
    String delimiter = ',';
    String numbersToProcess = numbers;

    if (numbers.startsWith('//')) {
      int delimiterEndIndex = numbers.indexOf('\n');
      if (delimiterEndIndex != -1) {
        String delimiterLine = numbers.substring(2, delimiterEndIndex);

        // Handle delimiters wrapped in brackets like [;] or multiple character delimiters
        if (delimiterLine.startsWith('[') && delimiterLine.endsWith(']')) {
          delimiter = delimiterLine.substring(1, delimiterLine.length - 1);
        } else {
          delimiter = delimiterLine;
        }

        numbersToProcess = numbers.substring(delimiterEndIndex + 1);
      }
    }

    // Step 3: Replace newlines with commas for uniform processing
    numbersToProcess = numbersToProcess.replaceAll('\n', delimiter);

    // Split by delimiter and process numbers
    List<String> numberStrings = numbersToProcess.split(delimiter);
    List<int> numbersList = [];
    List<int> negatives = [];

    for (String numberString in numberStrings) {
      if (numberString.trim().isNotEmpty) {
        int number = int.parse(numberString.trim());

        // Step 5: Check for negative numbers
        if (number < 0) {
          negatives.add(number);
        }

        // Step 6 (Extra): Ignore numbers bigger than 1000
        if (number <= 1000) {
          numbersList.add(number);
        }
      }
    }

    // Step 5: Throw exception if negative numbers found
    if (negatives.isNotEmpty) {
      String negativeNumbersStr = negatives.join(', ');
      throw ArgumentError('negative numbers not allowed: $negativeNumbersStr');
    }

    // Step 2: Sum all numbers
    return numbersList.fold(0, (sum, number) => sum + number);
  }
}