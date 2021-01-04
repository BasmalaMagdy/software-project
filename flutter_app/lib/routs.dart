//import 'dart:js';

import 'package:fetch_bby/screens/forgot_password/forgot_password_screen.dart';
import 'package:fetch_bby/screens/guest_demo_screen.dart';
import 'package:fetch_bby/screens/sign_in/sign_in_screen.dart';
import 'package:fetch_bby/screens/sign_up/sign_up_screen.dart';
import 'package:fetch_bby/screens/splash/splash_screen.dart';
import 'package:flutter/widgets.dart';

import 'screens/buy_signUp/buy_signUp_screen.dart';
import 'screens/sell_signUp/sell_signUp_screen.dart';

// We use name route
// All our routs will be availabe here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routName: (context) => ForgotPasswordScreen(),
  GuestDemoScreen.routName: (context) => GuestDemoScreen(),
  SignUpScreen.routName: (context) => SignUpScreen(),
  SellerSignUpScreen.routName: (context) => SellerSignUpScreen(),
  BuyerSignUpScreen.routName: (context) => BuyerSignUpScreen(),
};
