class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) {
      return 0;
    }

    String delimiter = ',';
    String numbersToProcess = numbers;

    // Check for custom delimiter
    if (numbers.startsWith('//')) {
      int delimiterEndIndex = numbers.indexOf('\n');
      delimiter = numbers.substring(2, delimiterEndIndex);
      numbersToProcess = numbers.substring(delimiterEndIndex + 1);
    }

    // Replace newlines and custom delimiters with commas
    numbersToProcess = numbersToProcess.replaceAll('\n', ',');
    numbersToProcess = numbersToProcess.replaceAll(delimiter, ',');

    List<String> numberStrings = numbersToProcess.split(',');
    return numberStrings
        .map((str) => int.parse(str))
        .fold(0, (sum, number) => sum + number);
  }
}