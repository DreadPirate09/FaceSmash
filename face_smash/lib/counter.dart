class Counter {
  Counter._();
  static final instance = Counter._();
  static int counter = 1;
  static int MAX_NUMBER = 16;
  Future<void> incrementCounter() async {
    if (counter >= MAX_NUMBER)
      counter = 1;
    else
      counter++;
  }

  Future<void> decrementCounter() async {
    counter--;
  }

  int get() {
    return counter;
  }
}
