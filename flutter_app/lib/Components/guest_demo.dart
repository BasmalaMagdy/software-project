import 'package:flutter_app/Pages/Home.dart';
import 'package:flutter_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:flutter_app/screens/guest_demo_screen.dart';
import 'package:flutter/material.dart';

import '../common/size_config.dart';

class GuestDemo extends StatelessWidget {
  const GuestDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //onTap: () => Navigator.popAndPushNamed(context, GuestDemoScreen.routName),
      onTap: () => Navigator.popAndPushNamed(context, MyHomePage.routeName),
      child: Text(
        "Continue as guest ",
        style: TextStyle(
            fontSize: getProportionateScreenWidth(28),
            color: Colors.orange[900]),
      ),
    );
  }
}
