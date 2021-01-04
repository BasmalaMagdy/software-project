import 'package:flutter/material.dart';

import '../../../common/size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key key,
    this.text,
    this.image,
  }) : super(key: key);

  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        // Text(
        //   "Welcome to fetch!",
        //   style: TextStyle(
        //       fontSize: getProportionateScreenWidth(50),
        //       fontWeight: FontWeight.w800),
        // ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.orange[900],
          ),
        ),
        Spacer(),
        Image.asset(image,
            height: getProportionateScreenHeight(300),
            width: getProportionateScreenWidth(300)),
      ],
    );
  }
}
