import 'package:flutter/material.dart';

import '../../size_config.dart';
import 'components/body.dart';

class SellerSignUpScreen extends StatelessWidget {
  static String routName = "/sell_signUp";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign Up",
          style: TextStyle(fontSize: getProportionateScreenHeight(20)),
        ),
      ),
      body: Body(),
    );
  }
}
