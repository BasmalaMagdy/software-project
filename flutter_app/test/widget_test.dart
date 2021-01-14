// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/Seller.dart';
import 'package:flutter_app/Pages/View.dart';
import 'package:flutter_app/Pages/about.dart';
import 'package:flutter_app/Pages/address.dart';
import 'package:flutter_app/Pages/end.dart';
import 'package:flutter_app/Pages/productview/product_view.dart';
import 'package:flutter_app/screens/sign_up/sign_up_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app/screens/splash/splash_screen.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/screens/splash/components/body.dart';
import 'package:flutter_app/screens/sign_in/sign_in_screen.dart';
import 'package:flutter_app/Pages/Home.dart';

void main() {
  testWidgets('Splash screen', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: SplashScreen()));
    expect(find.text('Continue'), findsOneWidget);
  });
  testWidgets('Sign In', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: SignInScreen()));
    expect(find.text('Sign In'), findsOneWidget);
  });

  testWidgets('About page', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: About()));
    expect(find.text('About'), findsOneWidget);
  });

  testWidgets('Address page', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Address()));
    expect(find.text('Add a new address'), findsOneWidget);
  });

  testWidgets('Done page', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Done()));
    expect(find.text('The payment is done.'), findsOneWidget);
  });

  testWidgets('SignUpScreen page', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: SignUpScreen()));
    expect(find.text('BUY'), findsOneWidget);
  });
}
