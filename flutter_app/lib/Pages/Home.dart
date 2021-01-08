import '../models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_pro/carousel_pro.dart';
import '../Components/Horizontal_listview.dart';
import '../Components/Product_card.dart';
import '../Components/Search.dart';
import '../Components/Sidemene.dart';
import '../Components/tabs.dart';

import '../Components/Horizontal_listview.dart';
import '../Components/Product_card.dart';
import '../Components/Search.dart';
import '../Components/Sidemene.dart';
import '../Components/carousel.dart';
import '../Pages/cart.dart';

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
  List<Map> products = [
    {
      'name': 'product0',
      'discription': 'this is a discription for the product 0',
      'price': 200,
      'oldprice': '150',
      'photo': 'hills1.jpeg',
      'category': 'shoes',
      //cart
      "size": "M",
      "color": "Red",
    },
    {
      'name': 'product1',
      'discription': 'this is a discription for the product 1',
      'price': 200,
      'oldprice': '150',
      'photo': 'dress1.jpeg',
      'category': 'dress',
      //cart
      "size": "S",
      "color": "Blue",
    },
    {
      'name': 'product2',
      'discription': 'this is a discription for the product 2',
      'price': 200,
      'oldprice': '150',
      'photo': 'blazer1.jpeg',
      'category': 'formal',
      //cart
      "size": "M",
      "color": "Red",
    },
    {
      'name': 'product3',
      'discription': 'this is a discription for the product 3',
      'price': 200,
      'oldprice': '150',
      'photo': 'blazer2.jpeg',
      'category': 'formal',
      //cart
      "size": "M",
      "color": "Red",
    },
    {
      'name': 'product4',
      'discription': 'this is a discription for the product 4',
      'price': 200,
      'oldprice': '150',
      'photo': 'dress2.jpeg',
      'category': 'dress',
      //cart
      "size": "M",
      "color": "Red",
    },
    {
      'name': 'product5',
      'discription': 'this is a discription for the product 5',
      'price': 200,
      'oldprice': '150',
      'photo': 'hills2.jpeg',
      'category': 'shoes',
      //cart
      "size": "M",
      "color": "Red",
    },
  ];
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
              style: TextStyle(color: Colors.black),
            ),
            Icon(Icons.location_on),
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
        ],
      ),
      drawer: SideList(
        user: person,
        products: pproducts,
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
                  fontSize: 18,
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
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
          ),
          for (var product in pproducts) CardProduct(product: product),
        ],
      ),
    );
  }
}
