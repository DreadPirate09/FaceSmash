class Counter {
  Counter._();
  static final instance = Counter._();
  static int counter = 1;
  static int MAX_NUMBER = 16;
  static var nameList = [
    'Pitroaca Gabriel',
    'Andreiasi Catalin',
    'Balica Adrian',
    'Mark',
    'Alex Pitroaca',
    'Razvanelul',
    'Diaconu Costica',
    'Vlad Marica',
    'Ioan',
    'Danci Denis',
    'Mario Rivis',
    'Un nimeni',
    'Paul STig',
    'Raul',
    'Rares',
    'Unu',
    'Paul Carabas'
  ];
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

  String getName(int index) {
    return nameList[index - 1];
  }
}
