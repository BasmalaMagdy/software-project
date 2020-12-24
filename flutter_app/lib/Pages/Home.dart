import 'package:flutter/material.dart';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter_app/Components/Horizontal_listview.dart';
import 'package:flutter_app/Components/Product_card.dart';
import 'package:flutter_app/Components/Search.dart';
import 'package:flutter_app/Components/Sidemene.dart';
import 'package:flutter_app/Pages/profile1.dart';
import 'package:flutter_app/Pages/test.dart';
import 'package:flutter_app/Pages/profile.dart';

import 'package:flutter_app/Pages/cart.dart';

// ignore: non_constant_identifier_names
List<BoxShadow> ShadowList = [
  BoxShadow(color: Colors.grey[300], blurRadius: 30, offset: Offset(0, 10))
];

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
      'price': '200',
      'oldprice': '150',
      'photo': 'accessories.png',
      "size": "M",
      "color": "Red",
      "quantity": 1,
    },
    {
      'name': 'product1',
      'discription': 'this is a discription for the product 1',
      'price': '200',
      'oldprice': '150',
      'photo': 'dress.png',
      "size": "M",
      "color": "Red",
      "quantity": 1,
    },
    {
      'name': 'product2',
      'discription': 'this is a discription for the product 2',
      'price': '200',
      'oldprice': '150',
      'photo': 'formal.png',
      "size": "M",
      "color": "Red",
      "quantity": 1,
    },
    {
      'name': 'product0',
      'discription': 'this is a discription for the product 0',
      'price': '200',
      'oldprice': '150',
      'photo': 'accessories.png',
      "size": "M",
      "color": "Red",
      "quantity": 1,
    },
    {
      'name': 'product1',
      'discription': 'this is a discription for the product 1',
      'price': '200',
      'oldprice': '150',
      'photo': 'dress.png',
      "size": "M",
      "color": "Red",
      "quantity": 1,
    },
    {
      'name': 'product2',
      'discription': 'this is a discription for the product 2',
      'price': '200',
      'oldprice': '150',
      'photo': 'formal.png',
      "size": "M",
      "color": "Red",
      "quantity": 1,
    },
  ];
  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    Widget ImageCarousel = new Container(
      height: 200.0,
      child: Carousel(
        boxFit: BoxFit.contain,
        images: [
          AssetImage('images/s0.jpg'),
          AssetImage('images/s1.jpg'),
          AssetImage('images/s2.jpg'),
          AssetImage('images/s3.jpg'),
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        indicatorBgPadding: 2.0,
        dotBgColor: Colors.transparent,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Colors.black),
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.title,
                style: TextStyle(color: Colors.black),
              ),
              Icon(Icons.location_on),
            ],
          ),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => new Cart()));//link the cart
              }),
        ],
      ),
      drawer: SideList(
        person: person,
      ),
      body: ListView(
        children: [
          Container(
            height: 40,
            padding: EdgeInsets.symmetric(horizontal: 20),
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    showSearch(context: context, delegate: DataSearch());
                  },
                ),
                GestureDetector(
                    onTap: () {
                      showSearch(context: context, delegate: DataSearch());
                    },
                    child: Container(
                      child: Text("Search Products"),
                    )),
                Icon(Icons.filter_list),
              ],
            ),
          ),
          // image carousel begin here
          ImageCarousel,
          // padding widget
          new Padding(
            padding: const EdgeInsets.all(4.0),
            // title for the categoties part
            child: new Text('Categories'),
          ),
          //   horizontal list of the categories
          HorizontalList(),

          // Grid View of Products
          new Padding(
            padding: const EdgeInsets.all(12.0),
            // title for the categoties part
            child: new Text('Recent products'),
          ),
          for (var product in products) CardProduct(product: product),
        ],
      ),
    );
  }
}
