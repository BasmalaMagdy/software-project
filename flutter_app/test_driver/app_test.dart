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

    test('Home page', () async {
      final text0 = find.byValueKey('email');
      final text1 = find.byValueKey('pass');
      await driver.tap(text0);
      await driver.enterText('buyer@gmail.com');

      await driver.tap(text1);
      await driver.enterText('1234567890');
      final text2 = find.text('Continue');
      await driver.tap(text2);

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
      final text = find.text('product1');
      expect(await driver.getText(text), 'product1');
    });

    test('add to cart the go to cart', () async {
      final button = find.byValueKey('addtocart');
      await driver.tap(button);
      final button0 = find.pageBack();
      await driver.tap(button0);
      /* final button0 = find.byValueKey('go_to_cart');
      await driver.tap(button0);
      final text = find.text('product1');*/
      final text = find.text('dress');
      expect(await driver.getText(text), 'dress');
    });
    /*test('back product view', () async {
      final button = find.pageBack();
      await driver.tap(button);
      final text = find.text('product1');
      expect(await driver.getText(text), 'product1');
    });*/

    /* test('back to category', () async {
      final button = find.pageBack();
      await driver.tap(button);
      final text = find.text('dress');
      expect(await driver.getText(text), 'dress');
    });*/

    test('back to home', () async {
      final button = find.pageBack();
      await driver.tap(button);
      final text = find.text('Fetch');
      expect(await driver.getText(text), 'Fetch');
    });
    test('open cart', () async {
      final button0 = find.byValueKey('go_to_cart');
      await driver.tap(button0);
      final text = find.text('product1');
      expect(await driver.getText(text), 'product1');
    });
    test('back to home', () async {
      final button = find.pageBack();
      await driver.tap(button);
      final text = find.text('Fetch');
      expect(await driver.getText(text), 'Fetch');
    });

    test('Sign out', () async {
      final SerializableFinder drawerOpenButton =
          find.byTooltip('Open navigation menu');
      await driver.tap(drawerOpenButton);
      // await driver.scroll(finder, dx, dy, duration)
      //await driver.scr
      await driver.scroll(find.byValueKey('here'), 100, 100.0,
          const Duration(milliseconds: 500));
      /*await driver.scrollUntilVisible(
        find.byValueKey('here'),
        find.byValueKey('out'),
        dxScroll: 20,
        timeout: Duration(milliseconds: 500),
      );*/
      final but = find.byValueKey("out");
      await driver.tap(but);
      // await driver.scroll(finder, dx, dy,
      final text = find.text('Sign In');
      expect(await driver.getText(text), 'Sign In');
    });

    /*test('open side', () async {
      final button = find.pageBack();
      await driver.tap(button);
      final text = find.text('My');
      expect(await driver.getText(text), 'My');
    });*/
  });
}
