import 'package:flutter/material.dart';

const PrimaryColor = Color(000000);
const SecondaryColor = Color(0xFF5B5B5B);
const PrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFDDF6F5), Color(0xFF8882B4)],
);

const AnimationDuration = Duration(milliseconds: 200);

//Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "No email was entered.";
const String kInvalidEmailError = "Email is not valid.";
const String kPasswordNullError = "No password was entered.";
const String kPasswordShortError = "Password is too short.";
const String kMatchPassError = "Passwords do not match.";
const String kNameNullError = "No Username was Entered.";
const String kNameShortError = "Username is too short.";
const String kPhoneInvalidError = "Phone number is invalid.";
const String kPhoneNullError = "No phone number was entered.";
const String kBrandNameNullError = "No brand name was entered.";
