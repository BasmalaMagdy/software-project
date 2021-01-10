import 'package:flutter/material.dart';
import 'package:flutter_app/Components/recommended.dart';
import 'package:flutter_app/common/size_config.dart';
import 'package:provider/provider.dart';

import '../Components/Horizontal_listview.dart';
import '../Components/Product_card.dart';
import '../Components/Search.dart';
import '../Components/Sidemene.dart';
import '../Components/carousel.dart';
import '../Components/tabs.dart';
import '../models/product.dart';
import '../models/user.dart';

class MyHomePage extends StatefulWidget {
  static String routeName = "/homepage";
  MyHomePage({
    Key key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String title = "Fetch";
  Map ahmedd = {
    'account': 'ahmed@gmail.com',
    'name': 'ahmed',
    'phone': '+201141111111',
    'photo': 'boy_profile.jpg',
    'type': 'buyer',
    'sid': 'sid'
  };

  @override
  Widget build(BuildContext context) {
    final List<ProductData> products = context.watch<List<ProductData>>();
    UserData customer = context.watch<UserData>();
    final List<SearchProductData> history =
        context.watch<List<SearchProductData>>();

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: SizeConfig.screenWidth * 0.07,
              ),
            ),
            /*Image.asset(
              'assets/icons/logo.png',
              height: 40,
              width: 40,
            ),
            Icon(Icons.location_on),*/
          ],
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => tabAppBar()));
                /*Navigator.pushNamed(
                  context,
                  '/test',
                );*/
              }),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        height: 10,
                        width: 45,
                        color: Colors.grey[400],
                      ),
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'images/coin.png',
                          width: 30,
                          height: 30,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '${customer.points}',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
      drawer: SideList(),
      /************************* */
      body: ListView(
        padding: EdgeInsets.only(bottom: 10),
        children: [
          SearchField(),
          //image carousel begin here
          //ImageCarousel,
          CarouselImg(),
          // padding widget
          new Padding(
            padding: const EdgeInsets.all(6.0),
            // title for the categoties part
            child: new Text(
              'Categories',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: SizeConfig.screenHeight * 0.04,
                  fontWeight: FontWeight.w600),
            ),
          ),
          //   horizontal list of the categories
          HorizontalList(),

          //        RECOMMENDED WIDGET
          if (history != null && history.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(6.0),
              // title for the categoties part
              child: new Text(
                'Recommended',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: SizeConfig.screenHeight * 0.04,
                    fontWeight: FontWeight.w600),
              ),
            ),
          if (history != null && history.isNotEmpty) Recommend(),

          // Grid View of Products
          new Padding(
            padding: const EdgeInsets.all(12.0),
            // title for the categoties part
            child: new Text(
              'Recent products',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: SizeConfig.screenHeight * 0.04,
                  fontWeight: FontWeight.w600),
            ),
          ),
          if (products != null && products.isNotEmpty)
            for (var product in products)
              CardProduct(
                product: product,
              ),
        ],
      ),
    );
  }
}
