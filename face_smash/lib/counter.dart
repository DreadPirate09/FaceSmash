class Counter {
  Counter._();
  static final instance = Counter._();
  static int counter = 0;
  static int max_member = 18;
  Future<void> incrementCounter() async {
    if (counter == max_member) {
      counter = 0;
    } else {
      counter++;
    }
  }

  Future<void> decrementCounter() async {
    counter--;
  }

  int get() {
    return counter;
  }
}
