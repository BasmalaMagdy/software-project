import 'package:flutter/material.dart';

import 'package:flutter_app/common/size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key key,
    this.text,
    this.press,
  }) : super(key: key);
  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //width: double.infinity,
      width: getProportionateScreenWidth(400),
      height: getProportionateScreenHeight(60),
      child: FlatButton(

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        color: Colors.black,
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: getProportionateScreenWidth(40),
          ),
        ),
      ),
    );
  }
}
