import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/editproduct/editproduct.dart';
import 'package:flutter_test/flutter_test.dart';
import '../lib/common/constants.dart';

import 'package:flutter_app/Pages/editprofile.dart';

void main() {
  group("input validation in edit profile", () {
    test('Test edit profile name', () {
      var result = Validate.namevalidator('name');
      expect(result, null);
    });

    test('Test edit profile name empty', () {
      var result = Validate.namevalidator('');
      expect(result, kNameNullError);
    });

    test('Test edit profile email valid', () {
      var result = Validate.emailvalidator('email@gmail.com');
      expect(result, null);
    });
    test('Test edit profile email Invalid', () {
      var result = Validate.emailvalidator('email');
      expect(result, kInvalidEmailError);
    });
    test('Test edit profile email empty', () {
      var result = Validate.emailvalidator('');
      expect(result, kEmailNullError);
    });

    test('Test edit profile phone', () {
      var result = Validate.phonevalidator('01117788459');
      expect(result, null);
    });

    test('Test edit profile phone', () {
      var result = Validate.phonevalidator('0111');
      expect(result, kPhoneInvalidError);
    });

    test('Test edit profile  phone', () {
      var result = Validate.phonevalidator('');
      expect(result, kPhoneNullError);
    });
  });
}
