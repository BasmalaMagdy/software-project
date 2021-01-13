import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/user_provider.dart';
import 'package:flutter_app/services/auth.dart';
import 'package:provider/provider.dart';
import '../common/size_config.dart';

class GuestDemo extends StatelessWidget {
  const GuestDemo({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //onTap: () => Navigator.popAndPushNamed(context, GuestDemoScreen.routName),
      onTap: () async {
        dynamic result = await context.read<AuthService>().guestUser();
        /*Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => UserProvider(
                      uid: result.uid,
                    )));*/
      }, //Navigator.popAndPushNamed(context, MyHomePage.routeName),
      child: Text(
        "Continue as guest ",
        style: TextStyle(
            fontSize: getProportionateScreenWidth(28),
            color: Colors.orange[900]),
      ),
    );
  }
}
