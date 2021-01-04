import 'package:flutter_app/common/size_config.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class SignUpScreen extends StatelessWidget {
  static String routName = "/sign_up";
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
