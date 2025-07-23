class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) {
      return 0;
    }

    List<String> numberStrings = numbers.split(',');
    return numberStrings
        .map((str) => int.parse(str))
        .fold(0, (sum, number) => sum + number);
  }
}