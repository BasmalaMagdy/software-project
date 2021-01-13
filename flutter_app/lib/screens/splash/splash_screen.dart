import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../screens/splash/components/body.dart';
import '../../models/product.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    //final brews = Provider.of<List<ProductData>>(context) ?? [];
    print("****************dsds********************");

    return Scaffold(
      body: Body(),
    );
  }
}
