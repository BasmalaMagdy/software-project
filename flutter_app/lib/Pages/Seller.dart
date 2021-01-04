import 'package:flutter/material.dart';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter_app/Components/Horizontal_listview.dart';
import 'package:flutter_app/Components/Product_card.dart';
import 'package:flutter_app/Components/Search.dart';
import 'package:flutter_app/Components/Sidemene.dart';
import 'package:flutter_app/Pages/cart.dart';
import 'package:flutter_app/Pages/createproduct.dart';
import 'package:flutter_app/Pages/profile.dart';

class SellerInterface extends StatefulWidget {
  static String routeName = "/seller";
  SellerInterface({Key key}) : super(key: key);

  @override
  _SellerInterfaceState createState() => _SellerInterfaceState();
}

class _SellerInterfaceState extends State<SellerInterface> {
  Map seller = {
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
      'category': 'accessories',
    },
    {
      'name': 'product1',
      'discription': 'this is a discription for the product 1',
      'price': '200',
      'oldprice': '150',
      'photo': 'dress.png',
      'category': 'dress',
    },
    {
      'name': 'product2',
      'discription': 'this is a discription for the product 2',
      'price': '200',
      'oldprice': '150',
      'photo': 'formal.png',
      'category': 'formal',
    },
    {
      'name': 'product0',
      'discription': 'this is a discription for the product 0',
      'price': '200',
      'oldprice': '150',
      'photo': 'accessories.png',
      'category': 'accessories',
    },
    {
      'name': 'product1',
      'discription': 'this is a discription for the product 1',
      'price': '200',
      'oldprice': '150',
      'photo': 'dress.png',
      'category': 'dress',
    },
    {
      'name': 'product2',
      'discription': 'this is a discription for the product 2',
      'price': '200',
      'oldprice': '150',
      'photo': 'formal.png',
      'category': 'formal',
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
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Drop",
              style: TextStyle(color: Colors.black),
            ),
            Icon(Icons.location_on),
          ],
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Profile(
                              person: seller,
                            )));
              }),
        ],
      ),
      /*************Drawer************ */
      /*drawer: SideList(
        user: seller,
        products: products,
      ),*/
      /************************* */
      body: ListView(
        children: [
          SearchField(),

          new Padding(
            padding: const EdgeInsets.all(4.0),
            // title for the categoties part
            child: new Text(
              'Categories',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
          //   horizontal list of the categories
          HorizontalList(
            products: products,
          ),

          // Grid View of Products
          new Padding(
            padding: const EdgeInsets.all(12.0),
            // title for the categoties part
            child: new Text(
              'All products',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
          for (var product in products) CardProduct(product: product),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        // isExtended: true,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CreateProduct()));
        },
      ),
    );
  }
}
