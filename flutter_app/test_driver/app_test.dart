// Imports the Flutter Driver API.
import 'package:flutter_app/Components/default_button.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Fetch app test', () {
    final button = find.byType('DefaultButton');
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('sign in', () async {
      await driver.tap(button);
      final text = find.text('Sign In');
      expect(await driver.getText(text), 'Sign In');
    });

    test('continue as gest', () async {
      final button = find.byType('GuestDemo');
      await driver.tap(button);
      final text = find.text('Fetch');
      expect(await driver.getText(text), 'Fetch');
    });

    test('category', () async {
      final button = find.descendant(
          of: find.byType('HorizontalList'), matching: find.text('Dress'));
      await driver.tap(button);
      final text = find.text('dress');
      expect(await driver.getText(text), 'dress');
    });

    test('Product view', () async {
      final button = find.text('product1');
      await driver.tap(button);
      final text = find.text('Size');
      expect(await driver.getText(text), 'Size');
    });

    test('add to cart the go to cart', () async {
      final button = find.byValueKey('addtocart');
      await driver.tap(button);
      final button0 = find.byValueKey('go_to_cart');
      await driver.tap(button0);
      final text = find.text('product1');
      expect(await driver.getText(text), 'product1');
    });
    test('back product view', () async {
      final button = find.pageBack();
      await driver.tap(button);
      final text = find.text('product1');
      expect(await driver.getText(text), 'product1');
    });

    test('back to category', () async {
      final button = find.pageBack();
      await driver.tap(button);
      final text = find.text('dress');
      expect(await driver.getText(text), 'dress');
    });

    test('back to home', () async {
      final button = find.pageBack();
      await driver.tap(button);
      final text = find.text('Fetch');
      expect(await driver.getText(text), 'Fetch');
    });
  });
}
