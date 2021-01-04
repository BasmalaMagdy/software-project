import 'package:flutter/material.dart';

import '../../size_config.dart';
import 'components/body.dart';

class BuyerSignUpScreen extends StatelessWidget {
  static String routName = "/buy_sigUp";
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
