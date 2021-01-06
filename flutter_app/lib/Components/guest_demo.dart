import 'package:flutter/material.dart';

import '../Pages/Home.dart';
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
