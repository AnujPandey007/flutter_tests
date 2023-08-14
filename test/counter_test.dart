import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tests/counter.dart';

void main(){
  late Counter counter;

  setUp(() {
    counter = Counter();
  });

  group("Counter Class", () {
    test("given counter class when it is instantiated then value of the count should be 0", () {
      final counterValue = counter.getCount();
      expect(counterValue, 0);
    });

    test("given counter class when it is incremented then value of the count should be 1", () {
      counter.incrementCount();
      final counterValue = counter.getCount();
      expect(counterValue, 1);
    });

    test("given counter class when it is decremented then value of the count should be -1", () {
      counter.decrementCount();
      final counterValue = counter.getCount();
      expect(counterValue, -1);
    });

    test("given counter class when it is reset then value of the count should be 0", () {
      counter.resetCounter();
      final counterValue = counter.getCount();
      expect(counterValue, 0);
    });

  });

}