import 'package:flutter_app/components/default_button.dart';
import 'package:flutter_app/common/constants.dart';
import 'package:flutter_app/screens/sign_in/sign_in_screen.dart';
import 'package:flutter_app/common/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

//this is the best practice
import '../components/splash_content.dart';
import '../../../components/default_button.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;

  List<Map<String, String>> splashData = [
    {
      "text": "Buy or Sell swiftly on fetch.",
      "image": "assets/images/girl.png",
    },
    /*{
      "text": "Speedy delivery is top-priority.",
      "image": "assets/images/fast.png",
    },
    {
      "text": "Our couriers are reliable and trustworthy.",
      "image": "assets/images/delivery-man.png",
    },*/
    {
      "text": "Sales are endless, keep an eye out!.",
      "image": "assets/images/tag.png",
    },
    {
      "text": "Collect Fetch coins and enjoy special offers.",
      "image": "assets/images/coins.png",
    },
  ];
  //cards text + images
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        //height: getProportionateScreenHeight(1),
        child: Column(
          children: <Widget>[
            Spacer(),
            //This Text() below belonged in splash_content, return if neccessary
            Text(
              "Welcome to fetch!",
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(50),
                  fontWeight: FontWeight.w800),
            ),
            Expanded(
                flex: 4,
                child: PageView.builder(
                    onPageChanged: (value) {
                      setState(() {
                        currentPage = value;
                      });
                    },
                    itemCount: splashData.length,
                    itemBuilder: (context, index) => SplashContent(
                          image: splashData[index]["image"],
                          text: splashData[index]["text"],
                        )
                )
            ),
            //Slider Dots row
            Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20),
                  ),
                  child: Column(
                    children: <Widget>[
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          splashData.length,
                          (index) => buildDot(index: index),
                        ),
                      ),
                      Spacer(
                        flex: 3,
                      ),
                      /*RaisedButton(
                          onPressed: (){
                            Navigator.pushNamed(context, SignInScreen.routeName);
                            },
                          color: Colors.red,
                          child: Text("Continue")
                      ),*/
                      DefaultButton(
                        text: "Continue",
                        press: () {
                          Navigator.pushNamed(context, SignInScreen.routeName);
                        },
                      ),
                      Spacer(),
                    ],
                  ),
                )
            )
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: AnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? Colors.orange[900] : Colors.black,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
