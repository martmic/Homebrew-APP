import 'package:homebrew/utils/coffee_tools.dart';
import 'package:test/test.dart';

void main() {
  group("cupsToOunces", () {
    test('calculates ounces on 1 cup', () {
      var ounces = CoffeeTools.cupsToOunces(1);
      expect(ounces, 6);
    });

    test('calculates ounces on positive number of cups', () {
      var ounces = CoffeeTools.cupsToOunces(4);
      expect(ounces, 24);
    });

    test('throws ArgumentError on zero', () {
      expect(() => CoffeeTools.cupsToOunces(0), throwsArgumentError);
    });

    test('throws ArgumentError on negative number', () {
      expect(() => CoffeeTools.cupsToOunces(0), throwsArgumentError);
    });
  });

  group("cups2grams", () {
    test('calculates grams of water on 5 cup', () {
      var grams = CoffeeTools.cups2grams(5);
      expect(grams, 887);
    });

    test('calculates grams of water on 1 cup', () {
      var grams = CoffeeTools.cups2grams(1);
      expect(grams, 177);
    });

    test('throws ArgumentError on zero', () {
      expect(() => CoffeeTools.cupsToOunces(0), throwsArgumentError);
    });
  });

  group("cups2F", () {
    test('calculates  French on 5 cup', () {
      var grams = CoffeeTools.cups2F(5);
      expect(grams, 63);
    });

    test('calculates French on 1 cup', () {
      var grams = CoffeeTools.cups2F(1);
      expect(grams, 12);
    });

    test('throws ArgumentError on zero', () {
      expect(() => CoffeeTools.cups2F(0), throwsArgumentError);
    });
  });

  group("cups2D", () {
    test('calculates Drip on 5 cup', () {
      var grams = CoffeeTools.cups2D(5);
      expect(grams, 52);
    });

    test('calculates Drip on 1 cup', () {
      var grams = CoffeeTools.cups2D(1);
      expect(grams, 10);
    });

    test('throws ArgumentError on zero', () {
      expect(() => CoffeeTools.cups2F(0), throwsArgumentError);
    });
  });
}
