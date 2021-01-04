import 'package:fetch_bby/screens/forgot_password/forgot_password_screen.dart';
import 'package:fetch_bby/screens/guest_demo_screen.dart';
import 'package:flutter/material.dart';

import '../size_config.dart';

class GuestDemo extends StatelessWidget {
  const GuestDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.popAndPushNamed(context, GuestDemoScreen.routName),
      child: Text(
        "Continue as guest ",
        style: TextStyle(
            fontSize: getProportionateScreenWidth(28),
            color: Colors.orange[900]),
      ),
    );
  }
}
