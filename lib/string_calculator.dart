class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) {
      return 0;
    }
    List<String> numberStrings = numbers.split(',');
    int sum = 0;

    for (String numberString in numberStrings) {
      sum += int.parse(numberString);
    }

    return sum;
  }
}