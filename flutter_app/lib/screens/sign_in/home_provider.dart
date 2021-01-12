import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/Home.dart';
import 'package:flutter_app/Pages/Seller.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/screens/wrapper.dart';
import 'package:flutter_app/services/auth.dart';
import 'package:provider/provider.dart';

import 'package:flutter_app/common/routs.dart';
import 'package:flutter_app/common/theme.dart';
import 'package:flutter_app/models/comment.dart';
import 'package:flutter_app/screens/splash/splash_screen.dart';
import 'package:flutter_app/services/database.dart';

class HomeProvider extends StatefulWidget {
  HomeProvider({this.user});
  final UserData user;
  @override
  _HomeProviderState createState() => _HomeProviderState();
}

class _HomeProviderState extends State<HomeProvider> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<DatabaseService>(
          create: (_) => DatabaseService(uid: widget.user.uid),
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
        StreamProvider(
          create: (context) =>
              context.read<DatabaseService>().history(uid: widget.user.uid),
        ),

        /*StreamProvider(
            create: (context) => context
                .read<DatabaseService>()
                .comments(pid: 'IpR9YumwKVfaauuDKmPb'),
          ),*/
      ],
      child: MyHomePage(),
    );
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
