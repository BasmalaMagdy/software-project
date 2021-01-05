//import 'dart:js';

import 'package:flutter_app/Pages/Home.dart';
import 'package:flutter_app/Pages/Seller.dart';
import 'package:flutter_app/Pages/about.dart';
import 'package:flutter_app/Pages/cart.dart';
import 'package:flutter_app/Pages/category.dart';
import 'package:flutter_app/Pages/createproduct.dart';
import 'package:flutter_app/Pages/product_view.dart';
import 'package:flutter_app/Pages/profile.dart';
import 'package:flutter_app/Pages/editprofile.dart';
import 'package:flutter_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:flutter_app/screens/guest_demo_screen.dart';
import 'package:flutter_app/screens/sign_in/sign_in_screen.dart';
import 'package:flutter_app/screens/sign_up/sign_up_screen.dart';
import 'package:flutter_app/screens/splash/splash_screen.dart';
import 'package:flutter/widgets.dart';

import '../screens/buy_signUp/buy_signUp_screen.dart';
import '../screens/sell_signUp/sell_signUp_screen.dart';

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
  MyHomePage.routeName:(context)=> MyHomePage(),
  Profile.routeName:(context) => Profile(),
  EditProfile.routeName:(context) => EditProfile(),
  Cart.routeName:(context) => Cart(),
  CategoryView.routeName:(context) => CategoryView(),
  Product.routeName:(context) => Product(),
  SellerInterface.routeName:(context) => SellerInterface(),
  CreateProduct.routeName:(context) => CreateProduct(),
  About.routeName:(context) => About(),
};
