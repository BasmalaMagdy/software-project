import 'package:flutter_app/screens/splash/components/body.dart';
import 'package:flutter_app/common/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/models/product.dart';
import 'package:flutter_app/services/database.dart';


class SplashScreen extends StatelessWidget {
  static String routeName = "/spllash";
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<ProductData>>(context) ?? [];
    print("****************dsds********************");
    for (int i = 0; i< brews.length;i++) {
      print(brews[i].name);
    }
    print(DatabaseService(uid: 'samyy').UID);
    // You have to call it on your starting screen
   //SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
