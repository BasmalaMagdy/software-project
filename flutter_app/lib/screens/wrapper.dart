import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Components/guest_demo.dart';
import 'package:flutter_app/Pages/Home.dart';
import 'package:flutter_app/common/size_config.dart';
import 'package:flutter_app/pages/home_provider.dart';
import 'package:flutter_app/screens/sign_in/sign_in_screen.dart';
import 'package:flutter_app/services/auth.dart';
import 'package:flutter_app/services/database.dart';
import 'package:provider/provider.dart';

class Wraper extends StatelessWidget {
  const Wraper({Key key}) : super(key: key);
  static String routeName = "/";

  @override
  Widget build(BuildContext context) {
    //final user = Provider.of<UserModel>(context);
    final user = context.watch<User>();
    SizeConfig().init(context);

    if (user != null) {
      /*return Scaffold(
        body: Center(
          child: FlatButton(
              onPressed: () async {
                await context.read<AuthService>().signOut();
              },
              child: Text('sign out')),
        ),
      );*/
      return MultiProvider(
        /*builder: (context, child) {
          return MyHomePage(context: context);
        },*/
        providers: [
          Provider<DatabaseService>(
            create: (_) => DatabaseService(uid: user.uid),
          ),
          StreamProvider(
            create: (context) =>
                context.read<DatabaseService>().history(uid: user.uid),
          ),
          StreamProvider(
            create: (context) =>
                context.read<DatabaseService>().cart(uid: user.uid),
          ),
          StreamProvider(
            create: (context) =>
                context.read<DatabaseService>().orders(uid: user.uid),
          ),
          StreamProvider(
            create: (context) => context.read<DatabaseService>().Products,
          ),
          StreamProvider(
            create: (context) => context.read<DatabaseService>().Categories,
          ),
          StreamProvider(
            create: (context) => context.read<DatabaseService>().Users,
          ),
        ],
        child: MyHomePage(),
      );
    }
    return SignInScreen();
    //return Authenticate();
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_app/Pages/HomeGuest.dart';
// import 'package:flutter_app/models/user.dart';
// import 'package:flutter_app/screens/sign_in/sign_in_screen.dart';
// import 'package:provider/provider.dart';

// class Wrapper extends StatelessWidget {
//   //static String routeName = "/wrapper";
//   @override
//   Widget build(BuildContext context) {
//     final user = Provider.of<UserData>(context);
//     if (user == null) {
//       print('mega bruh moment');
//       return SignInScreen();
//     } else {
//       print('bruh moment');
//       return GuestHomePage();
//     }
//   }
// }
