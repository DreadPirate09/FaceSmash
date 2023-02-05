class Counter {
  Counter._();
  static final instance = Counter._();
  static int counter = 1;
  static int counter2 = 2;
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
  Future<void> incrementCounter1() async {
    if (counter >= MAX_NUMBER)
      counter = 1;
    else
      counter++;
    if (counter == counter2) counter++;
  }

  Future<void> incrementCounter2() async {
    if (counter2 >= MAX_NUMBER)
      counter2 = 1;
    else
      counter2++;
    if (counter == counter2) counter2++;
  }

  Future<void> decrementCounter() async {
    counter--;
  }

  int get1() {
    return counter;
  }

  int get2() {
    return counter2;
  }

  String getName(int index) {
    return nameList[index - 1];
  }
}
