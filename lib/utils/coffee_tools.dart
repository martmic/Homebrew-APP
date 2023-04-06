class CoffeeTools {
  // Input: number of cups (positive integer)
  // Output: number of ounces in a cup
  static int cupsToOunces(int cups) {
    if (cups <= 0) {
      throw ArgumentError();
    }
    return cups * 6;
  }

  static double cups2grams(int cups) {
    if (cups <= 0) {
      throw ArgumentError();
    } else {
      var grams = ((cups * 6) * 29.57).floor();
      cups = grams;
    }

    return cups * 1.0;
  }

  static double cups2F(int cups) {
    if (cups <= 0) {
      throw ArgumentError();
    } else {
      var grams = (((cups * 6) * 29.57) / 14).floor();
      cups = grams;
    }

    return cups * 1.0;
  }

  static double cups2D(int cups) {
    if (cups <= 0) {
      throw ArgumentError();
    } else {
      var grams = (((cups * 6) * 29.57) / 17).floor();
      cups = grams;
    }

    return cups * 1.0;
  }
}
