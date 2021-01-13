import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/Home.dart';
import 'package:flutter_app/Pages/HomeGuest.dart';
import 'package:flutter_app/Pages/Seller.dart';
import 'package:flutter_app/models/product.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/screens/wrapper.dart';
import 'package:flutter_app/services/auth.dart';
import 'package:flutter_app/services/storage.dart';
import 'package:provider/provider.dart';

import 'package:flutter_app/common/routs.dart';
import 'package:flutter_app/common/theme.dart';
import 'package:flutter_app/models/comment.dart';
import 'package:flutter_app/screens/splash/splash_screen.dart';
import 'package:flutter_app/services/database.dart';

class HomeProvider extends StatefulWidget {
  HomeProvider({this.uid});
  final String uid;
  @override
  _HomeProviderState createState() => _HomeProviderState();
}

class _HomeProviderState extends State<HomeProvider> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WelcomePage extends StatefulWidget {
  WelcomePage({Key key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    final user = context.watch<User>();
    final List<ProductData> products = context.watch<List<ProductData>>();
    UserData customer = context.watch<UserData>();
    final List<SearchProductData> history =
        context.watch<List<SearchProductData>>();
    print(user.uid);
    if (customer != null) print(customer.email);
    if (products != null) print(products[0].name);
    if (history != null) print(history);
    if ((customer != null) && (products != null) && (history != null))
      return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FlatButton(
                onPressed: () {
                  //Navigator.pushNamed(context, MyHomePage.routeName);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyHomePage()));
                },
                child: Text("Welcome to Fetch application"),
              ),
              FlatButton(
                onPressed: () async {
                  await context.read<AuthService>().signOut();
                },
                child: Text('Sign out'),
              ),
            ]),
      );
    else
      return Loading();
  }
}

class CheckUser extends StatefulWidget {
  @override
  _CheckUserState createState() => _CheckUserState();
}

class _CheckUserState extends State<CheckUser> {
  @override
  Widget build(BuildContext context) {
    UserData user = context.watch<UserData>();
    print(user.uid);
    if (user != null) {
      if (user.type == 'buyer') {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyHomePage()));
      } else if (user.type == 'seller') {
        Navigator.pushNamed(
          context,
          SellerInterface.routeName,
        );
      }
    }
    return Container();
  }
}
