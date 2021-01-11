import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
//import 'package:flutter_app/lib/common/constants.dart';

import 'package:flutter_app/screens/buy_signUp/components/body.dart';
/*
void main() {
  test('Test sign up email', () {
    var result = EmailFieldValidator.validator('ahmed@gmail.com');
    expect(result, null);
  });

  test('Test sign up password', () {
    var result = PasswordFieldValidator.validator('123456aaa');
    expect(result, null);
  });

  test('Test sign up Confirm password', () {
    var result2 = PasswordFieldValidator.validator('123456aaa');
    //PasswordFieldValidator.password = '123456aaa';
    var result = PasswordFieldValidator.confirmvalidator('123456aaa');
    expect(result, null);
  });

  test('Test sign up email empty', () {
    var result = EmailFieldValidator.validator("");
    expect(result, kEmailNullError);
  });

  test('Test sign up password empty', () {
    var result = PasswordFieldValidator.validator("");
    expect(result, kPasswordNullError);
  });

  test('Test sign up email  InValid', () {
    var result = EmailFieldValidator.validator("samy");
    expect(result, kInvalidEmailError);
  });

  test('Test sign up password short', () {
    var result = PasswordFieldValidator.validator("4578");
    expect(result, kPasswordShortError);
  });
}
*/
/*

class PhoneFieldValidator {
  static String validator(value) {
    if (value.isEmpty) {
      //addError(error: kPhoneNullError);
      return kPhoneNullError;
    } else if (value.isNotEmpty) {
      //removeError(error: kPhoneNullError);
      if (value.length < 11 || value.length > 11) {
        //addError(error: kPhoneInvalidError);
        return kPhoneNullError;
      } else if (value.length == 11) {
        //removeError(error: kPhoneInvalidError);
        return kPhoneInvalidError;
      }
    }
    return null;
  }
}

class EmailFieldValidator {
  static String validator(value) {
    if (value.isEmpty) {
      //_SignFormState().addError(error: kEmailNullError);
      return kEmailNullError;
    } else if (!emailValidatorRegExp.hasMatch(value)) {
      //_SignFormState().addError(error: kInvalidEmailError);
      return kInvalidEmailError;
    }
    return null;
  }
}

String password;

class PasswordFieldValidator {
  // static String password;
  static String validator(value) {
    password = value;
    if (value.isEmpty) {
      //_SignFormState().addError(error: kPasswordNullError);
      return kPasswordNullError;
    } else if (value.length < 8) {
      //_SignFormState().addError(error: kPasswordShortError);
      return kPasswordShortError;
    }
    return null;
  }

  static String confirmvalidator(value) {
    if (value.isEmpty) {
      return kPasswordNullError;
    } else if (value.isNotEmpty) {
      if (value == password) {
        //removeError(error: kMatchPassError);
        return kMatchPassError;
      } else if (value != password) {
        //addError(error: kMatchPassError);
        return kMatchPassError;
      }
      //return "";
    }
    return null;
  }
}

*/
