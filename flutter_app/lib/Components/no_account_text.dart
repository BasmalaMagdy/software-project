import '../screens/sign_up/sign_up_screen.dart';
import 'package:flutter/material.dart';

import '../common/size_config.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(28),
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      SignUpScreen())), //Navigator.pushNamed(context, SignUpScreen.routName),
          child: Text(
            "Sign Up ",
            style: TextStyle(
                fontSize: getProportionateScreenWidth(28),
                color: Colors.orange[900]),
          ),
        )
      ],
    );
  }
}
