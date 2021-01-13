import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/screens/wrapper.dart';
import 'package:flutter_app/services/auth.dart';
import 'package:provider/provider.dart';

import 'common/routs.dart';
import 'common/theme.dart';
import 'models/comment.dart';
import 'screens/splash/splash_screen.dart';
import 'services/database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /*@override
  void initState() {
    // TODO: implement initState
    super.initState();
    DatabaseService sam =DatabaseService(uid: 'paAxQm9OScVWUpdENVV76ZE2gDM2');
    final brews = Provider.of<List<ProductData>>(context) ?? [];
    print("****************dsds********************");
    print(brews);
  }*/
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthService>().authStateChanges,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        title: 'Flutter Demo',
        theme: theme(),
        // home: Wraper(),
        //initialRoute: Wraper.routeName,
        //routes: routes,
        //home: MyHomePage(title: 'Drop'),
        // home: Wraper(),
        home: SplashScreen(),
      ),
    );

    /*return StreamProvider<UserData>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        title: 'Flutter Demo',
        theme: theme(),
        home: SplashScreen(),
        //initialRoute: SplashScreen.routeName,
       // routes: routes,
        //home: MyHomePage(title: 'Drop'),
        //home: Wrapper(),
      ),
    );*/
  }
}
