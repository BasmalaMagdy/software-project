import 'package:flutter_app/components/default_button.dart';
import 'package:flutter_app/screens/buy_signUp/buy_signUp_screen.dart';
import 'package:flutter_app/screens/sell_signUp/sell_signUp_screen.dart';
import 'package:flutter_app/common/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(60)),
        child: Column(
          children: [
            SizedBox(height: SizeConfig.screenHeight * 0.08),
            Image(
                image: AssetImage('assets/icons/logo.png'),
                width: double.infinity,
                height: getProportionateScreenHeight(100)),
            SizedBox(height: SizeConfig.screenHeight * 0.08),
            Text(
              "You're Looking Forward To:",
              style: TextStyle(
                  fontSize: (getProportionateScreenWidth(50)),
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.08),
            DefaultButton(
              text: "BUY",
              press: () {
                Navigator.pushNamed(context, BuyerSignUpScreen.routName);
              },
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.08),
            DefaultButton(
              text: "SELL",
              press: () {
                Navigator.pushNamed(context, SellerSignUpScreen.routName);
              },
            )
          ],
        ),
      ),
    );
  }
}
