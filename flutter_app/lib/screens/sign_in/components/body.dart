import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/HomeGuest.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/screens/sign_in/sign_in_screen.dart';
import 'package:provider/provider.dart';

import '../../../components/guest_demo.dart';
import '../../../components/no_account_text.dart';
import '../../../screens/sign_in/components/sign_form.dart';
import '../../../common/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //////////LATEST
    // final user = Provider.of<UserData>(context);
    // if (user == null) {
    //   return SignInScreen();
    // } else {
    //   return GuestHomePage();
    // }
    //////////LATEST
    return SafeArea(
        child: SizedBox(
      width: double.infinity,
      child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(60),
            //vertical: getProportionateScreenHeight(1)
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //SizedBox(height: SizeConfig.screenHeight * 0.05),
                Image(
                    image: AssetImage(
                      "assets/icons/logo.png",
                    ),
                    height: getProportionateScreenHeight(100),
                    width: double.infinity),

                //Spacer(),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                Padding(
                  padding: EdgeInsets.only(right: 6.5),
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(40),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.01),
                //IF YOU WANT TO ADD LATER INFO UNDER SIGN IN.
                //Text("")
                //Spacer(),
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                SignForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                NoAccountText(),
                SizedBox(height: SizeConfig.screenHeight * 0.01),
                GuestDemo()

                //Spacer(flex: 5),
              ],
            ),
          )),
    ));
  }
}
