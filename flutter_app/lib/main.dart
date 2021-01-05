import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/Home.dart';
import 'package:flutter_app/common/routs.dart';
import 'package:flutter_app/models/comment.dart';
import 'package:flutter_app/screens/splash/splash_screen.dart';
import 'package:flutter_app/common/theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/services/database.dart';
import 'package:flutter_app/models/product.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
  List productdoc;
  Future<List<CommentData>> commentdoc;
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
    DatabaseService().CreateProductData(
        'name', 'category', 'description', 'photo', 'sid', 5, 8);
    //DatabaseService().updateProductData('6IVjL0gX1EysM2iNTk9H', 'name', 'category', 'description', 'photo', 'sid', 8, 10);
    return StreamProvider<List<ProductData>>.value(
        value: DatabaseService().Products,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          /*theme: ThemeData(
            primaryColor: const Color(0xFF02BB9F),
            primaryColorDark: const Color(0xFF167F67),
            accentColor: const Color(0xFF167F67),
          ),*/
          title: 'Flutter Demo',
          theme: theme(),
          // home: SplashScreen(),
          initialRoute: SplashScreen.routeName,
          routes: routes,
          //home: MyHomePage(title: 'Drop'),
        ));
  }
}
