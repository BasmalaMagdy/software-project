import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../lib/common/constants.dart';

import 'package:flutter_app/screens/sign_in/components/sign_form.dart';

void main() {
  test('Test sign in email', () {
    var result = EmailFieldValidator.validator('ahmed@gmail.com');
    expect(result, null);
  });

  test('Test sign in password', () {
    var result = PasswordFieldValidator.validator('123456aaa');
    expect(result, null);
  });

  test('Test sign in email empty', () {
    var result = EmailFieldValidator.validator("");
    expect(result, kEmailNullError);
  });

  test('Test sign in password empty', () {
    var result = PasswordFieldValidator.validator("");
    expect(result, kPasswordNullError);
  });

  test('Test sign in email  InValid', () {
    var result = EmailFieldValidator.validator("samy");
    expect(result, kInvalidEmailError);
  });

  test('Test sign in password short', () {
    var result = PasswordFieldValidator.validator("4578");
    expect(result, kPasswordShortError);
  });
}
