class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) {
      return 0;
    }

    // Replace newlines with commas for uniform processing
    String processedNumbers = numbers.replaceAll('\n', ',');

    List<String> numberStrings = processedNumbers.split(',');
    return numberStrings
        .map((str) => int.parse(str))
        .fold(0, (sum, number) => sum + number);
  }
}