// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  FlutterDriver driver;

  // Connect to the Flutter driver before running any tests.
  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  // Close the connection to the driver after the tests have completed.
  tearDownAll(() async {
    if (driver != null) {
      driver.close();
    }
  });

  group('Happy Paths', () {
    /*
      Given I am on the Coffee Device Selection Screen

      When I tap "French Press"
      And I tap "Continue"
      And I enter "5"
      And I tap "Continue"
      Then I should see "63g - course ground coffee"
      And I should see "887g - water"
    */
    test("should give recommendation for French Press", () async {
      final device_text = find.byValueKey("device_text");

      expect(await driver.getText(device_text),
          'What coffee maker are you using?');

      final device_french = find.byValueKey("device_french");

      await driver.tap(device_french);

      final device_screen_continue = find.byValueKey("device_screen_continue");

      await driver.tap(device_screen_continue);

      final cups_input = find.byValueKey("cups_input");

      await driver.tap(cups_input);

      await driver.enterText("5");

      final cups_screen_continue = find.byValueKey("cups_screen_continue");

      await driver.tap(cups_screen_continue);

      final rec_output = find.byValueKey("rec_output");

      expect(await driver.getText(rec_output),
          "63" + " - course ground coffee" + "\n" + "887" + " - water");

      final rec_continue = find.byValueKey("rec_continue");

      await driver.tap(rec_continue);

      // your code here
    });

    /*
      Given I am on the Coffee Device Selection Screen
      When I tap "Drip Machine"
      And I tap "Continue"
      And I enter "5"
      And I tap "Continue"
      Then I should see "52g - medium ground coffee"
      And I should see "887g - water"
    */
    test("should give recommendation for Drip Machine", () async {
      //your code here
      final device_text = find.byValueKey("device_text");

      expect(await driver.getText(device_text),
          'What coffee maker are you using?');

      final device_drip = find.byValueKey("device_drip");

      await driver.tap(device_drip);

      final device_screen_continue = find.byValueKey("device_screen_continue");

      await driver.tap(device_screen_continue);

      final cups_input = find.byValueKey("cups_input");

      await driver.tap(cups_input);

      await driver.enterText("5");

      final cups_screen_continue = find.byValueKey("cups_screen_continue");

      await driver.tap(cups_screen_continue);

      final rec_output = find.byValueKey("rec_output");

      expect(await driver.getText(rec_output),
          "52" + " - medium ground coffee" + "\n" + "887" + " - water");

      final rec_continue = find.byValueKey("rec_continue");

      await driver.tap(rec_continue);
    });
  });

  group('Sad Paths', () {
    /*
      Given I am on the Coffee Device Selection Screen

      When I press "Continue"
      Then I expect to still be on the Coffee Device Selection Screen
    */
    test("should not advance from Choose Device Screen without a selection",
        () async {
      final device_text = find.byValueKey("device_text");
      final device_screen_continue = find.byValueKey("device_screen_continue");

      expect(await driver.getText(device_text),
          'What coffee maker are you using?');

      await driver.tap(device_screen_continue);

      expect(await driver.getText(device_text),
          'What coffee maker are you using?');

      //your code here
    });

    /*
      Given I chose "French Press" on the Coffee Device Selection Screen
      And I advanced to the Choose Cups Screen
      When I press "Continue"
      Then I expect to still be on the Choose Cups Screen
    */
    test("should not advance from Choose Cups Screen without cups", () async {
      //your code here
      final device_french = find.byValueKey("device_french");

      await driver.tap(device_french);

      final device_screen_continue = find.byValueKey("device_screen_continue");

      await driver.tap(device_screen_continue);

      final cups_screen_continue = find.byValueKey("cups_screen_continue");

      final cups_text = find.byValueKey("cups_text");

      expect(await driver.getText(cups_text), "How many cups would you like? ");

      await driver.tap(cups_screen_continue);

      expect(await driver.getText(cups_text), "How many cups would you like? ");
    });

    /*
      Given I chose "French Press" on the Coffee Device Selection Screen
      And I advanced to the Choose Cups Screen
      When I enter "-1"
      And I press "Continue"
      Then I expect to still be on the Choose Cups Screen
    */
    /*
      Given I chose "French Press" on the Coffee Device Selection Screen
      And I advanced to the Choose Cups Screen
      When I enter "a"
      And I press "Continue"
      Then I expect to still be on the Choose Cups Screen
    */

    /*
      Given I chose "Drip Machine" on the Coffee Device Selection Screen
      And I advanced to the Choose Cups Screen
      When I press "Continue"
      Then I expect to still be on the Choose Cups Screen
    */
    test("should not advance from Choose Cups Screen without cups", () async {
      final cups_back = find.byValueKey("cups_back");

      await driver.tap(cups_back);

      final device_drip = find.byValueKey("device_drip");

      await driver.tap(device_drip);

      final device_screen_continue = find.byValueKey("device_screen_continue");

      await driver.tap(device_screen_continue);

      final cups_text = find.byValueKey("cups_text");

      final cups_screen_continue = find.byValueKey("cups_screen_continue");

      expect(await driver.getText(cups_text), "How many cups would you like? ");

      await driver.tap(cups_screen_continue);

      expect(await driver.getText(cups_text), "How many cups would you like? ");

      //your code here
    });

    /*
      Given I chose "Drip Machine" on the Coffee Device Selection Screen
      And I advanced to the Choose Cups Screen
      When I enter "-1"
      And I press "Continue"
      Then I expect to still be on the Choose Cups Screen
    */
    /*
      Given I chose "Drip Machine" on the Coffee Device Selection Screen
      And I advanced to the Choose Cups Screen
      When I enter "a"
      And I press "Continue"
      Then I expect to still be on the Choose Cups Screen
    */
  });

  group('Back Button', () {
    //make up your own tests to check that the back button works

    test("should advance to recommendation page", () async {
      //your code here
      final cups_input = find.byValueKey("cups_input");

      await driver.tap(cups_input);

      await driver.enterText("2");

      final cups_screen_continue = find.byValueKey("cups_screen_continue");

      await driver.tap(cups_screen_continue);

      final rec_text = find.byValueKey("rec_text");

      expect(await driver.getText(rec_text), "Recommended ");
    });

    test("should go back to the cups page once clicking 'back icon' ",
        () async {
      //your code here
      final rec_back = find.byValueKey("rec_back");

      await driver.tap(rec_back);

      final cups_text = find.byValueKey("cups_text");

      expect(await driver.getText(cups_text), "How many cups would you like? ");
    });

    test("should go back to the device page once clicking 'back icon' ",
        () async {
      //your code here
      final cups_back = find.byValueKey("cups_back");

      await driver.tap(cups_back);

      final device_text = find.byValueKey("device_text");

      expect(await driver.getText(device_text),
          'What coffee maker are you using?');
    });

    //on every page
  });
}
