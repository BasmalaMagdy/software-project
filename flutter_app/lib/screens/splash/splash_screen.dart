import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../screens/splash/components/body.dart';
import '../../models/product.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/spllash";
  @override
  Widget build(BuildContext context) {
    //final brews = Provider.of<List<ProductData>>(context) ?? [];
    print("****************dsds********************");
    //print(context.watch<List<CommentData>>());
    print(context.watch<List<ProductData>>());
    print(context.watch<List<ProductData>>()[0].price);

    //print(brews);
    /* for (int i = 0; i < brews.length; i++) {
      print(brews[i].name);
    }*/
    //print(DatabaseService(uid: 'samyy').UID);
    // You have to call it on your starting screen
    //SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
