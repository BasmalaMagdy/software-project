import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/vip.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/screens/sign_in/sign_in_screen.dart';
import 'package:flutter_app/screens/sign_in/user_provider.dart';
import 'package:flutter_app/screens/wrapper.dart';
import 'package:flutter_app/services/auth.dart';
import 'package:provider/provider.dart';

import '../Pages/HomeGuest.dart';
import '../common/size_config.dart';

/////////////////CHANGED GUEST DEMO FROM STATELESS TO STAEFUL
/*
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
*/

//////////////////////LATEST
class GuestDemo extends StatefulWidget {
  const GuestDemo({
    Key key,
  }) : super(key: key);
  @override
  _GuestDemoState createState() => _GuestDemoState();
}

class _GuestDemoState extends State<GuestDemo> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    UserData guest = context.watch<UserData>();

    //////////////////LATEST: CONVERTED GESTURE DETECTOR TO BUTTON
    // return GestureDetector(
    //   //onTap: () => Navigator.popAndPushNamed(context, GuestDemoScreen.routName),
    //   ////////////////LATEST: CHANGED ROUTE FROM HOMEPAGE TO GUESTHOMEPAGE
    //   onTap: () =>
    //       Navigator.popAndPushNamed(context, GuestHomePage.routeName,),

    //   ////////////////LATEST
    //   child: Text(
    //     "Continue as guest ",
    //     style: TextStyle(
    //         fontSize: getProportionateScreenWidth(28),
    //         color: Colors.orange[900]),
    //   ),
    // );

    return (TextButton(
      child: Text(
        "Continue as guest.",
        style: TextStyle(
            fontSize: getProportionateScreenWidth(29),
            color: Colors.orange[900],
            fontWeight: FontWeight.normal),
      ),
      style: ButtonStyle(
        //backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        overlayColor: MaterialStateProperty.all<Color>(Colors.white),
      ),
      onPressed: () async {
        dynamic result = await _auth.guestUser();
        if (result == null) {
          print('error signing in');
          Navigator.popAndPushNamed(
            context,
            SignInScreen.routeName,
          );
        } else {
          print('signed in');

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => UserProvider(
                        user: result,
                      )));

          print(result.uid);
          //guest.uid = result;
        }
        //Wrapper();
      },
    ));
    //////////////////LATEST
  }
}

//////////////////////LATEST
