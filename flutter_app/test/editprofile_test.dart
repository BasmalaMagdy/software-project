import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/editproduct/editproduct.dart';
import 'package:flutter_test/flutter_test.dart';
import '../lib/common/constants.dart';

import 'package:flutter_app/Pages/editprofile.dart';

void main() {
  group("input validation in edit profile", () {
    test('Test edit profile name', () {
      var result = Validator.namevalidator('name');
      expect(result, null);
    });

    test('Test edit profile name empty', () {
      var result = Validator.namevalidator('');
      expect(result, kNameNullError);
    });

    test('Test edit profile email valid', () {
      var result = Validator.emailvalidator('email@gmail.com');
      expect(result, null);
    });
    test('Test edit profile email Invalid', () {
      var result = Validator.emailvalidator('email');
      expect(result, kInvalidEmailError);
    });
    test('Test edit profile email empty', () {
      var result = Validator.emailvalidator('');
      expect(result, kEmailNullError);
    });

    test('Test edit profile phone', () {
      var result = Validator.phonevalidator('01117788459');
      expect(result, null);
    });

    test('Test edit profile phone', () {
      var result = Validator.phonevalidator('0111');
      expect(result, kPhoneInvalidError);
    });

    test('Test edit profile  phone', () {
      var result = Validator.phonevalidator('');
      expect(result, kPhoneNullError);
    });
  });
}
