import 'package:flutter/material.dart';
import 'package:flutter_app/common/size_config.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../Components/Horizontal_listview.dart';
import '../Components/Product_card.dart';
import '../Components/Search.dart';
import '../Components/Sidemene.dart';
import 'package:flutter_app/Pages/cart.dart';
import '../Components/carousel.dart';

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
  Map person = {
    'account': 'ahmed@gmail.com',
    'name': 'ahmed',
    'phone': '+201141111111',
    'photo': 'profile.JPG',
  };

  @override
  Widget build(BuildContext context) {
    final List<ProductData> pproducts = context.watch<List<ProductData>>();

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
                    MaterialPageRoute(builder: (context) => Cart()));
                /*Navigator.pushNamed(
                  context,
                  '/test',
                );*/
              }),
        ],
      ),
      drawer: SideList(
        user: person,
      ),
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
          for (var product in pproducts) CardProduct(product: product),
        ],
      ),
    );
  }
}
