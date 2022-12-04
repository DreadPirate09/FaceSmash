class Counter {
  Counter._();
  static final instance = Counter._();
  static int counter = 0;
  Future<void> incrementCounter() async {
    counter++;
  }

  Future<void> decrementCounter() async {
    counter--;
  }

  int get() {
    return counter;
  }
}
