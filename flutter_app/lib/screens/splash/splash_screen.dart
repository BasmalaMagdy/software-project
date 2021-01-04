import 'package:flutter_app/screens/splash/components/body.dart';
import 'package:flutter_app/common/size_config.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/spllash";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
   //SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
