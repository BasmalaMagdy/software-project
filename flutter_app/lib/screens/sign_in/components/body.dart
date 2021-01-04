import 'dart:ffi';

import 'package:flutter_app/components/default_button.dart';
import 'package:flutter_app/components/form_error.dart';
import 'package:flutter_app/components/guest_demo.dart';
import 'package:flutter_app/components/no_account_text.dart';
import 'package:flutter_app/common/constants.dart';
import 'package:flutter_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:flutter_app/screens/sign_in/components/sign_form.dart';
import 'package:flutter/material.dart';

import '../../../common/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                NoAccountText(),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                GuestDemo()

                //Spacer(flex: 5),
              ],
            ),
          )),
    ));
  }
}
