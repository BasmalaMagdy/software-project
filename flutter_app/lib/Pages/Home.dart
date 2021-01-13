import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Components/recommended.dart';
import 'package:flutter_app/Pages/cart.dart';
import 'package:flutter_app/Pages/createproduct/createproduct.dart';
import 'package:flutter_app/common/size_config.dart';
import 'package:flutter_app/models/cart_database.dart';
import 'package:flutter_app/models/order.dart';
import 'package:flutter_app/services/auth.dart';
import 'package:provider/provider.dart';

import 'package:flutter_app/Components/Horizontal_listview.dart';
import 'package:flutter_app/Components/Product_card.dart';
import 'package:flutter_app/Components/Search.dart';
import 'package:flutter_app/Components/Sidemene.dart';
import 'package:flutter_app/Components/carousel.dart';
import 'package:flutter_app/Components/tabs.dart';
import 'package:flutter_app/models/product.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/services/storage.dart';

class MyHomePage extends StatefulWidget {
  static String routeName = "/homepagea";
  MyHomePage({
    Key key,
    this.context,
  }) : super(key: key);
  final BuildContext context;
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
    final UserData customer = context.watch<UserData>();
    final List<SearchProductData> history =
        context.watch<List<SearchProductData>>();
    final List<userCartData> cart = context.watch<List<userCartData>>();
    final List<OrderData> orders = context.watch<List<OrderData>>();

    if (customer != null) print(customer.points);
    if (products != null) print(products[0].name);
    if (history != null) print(history);
    if ((customer != null) && (products != null) && (history != null))
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
            ],
          ),
          actions: <Widget>[
            if (customer.guest == false && customer.type == 'buyer')
              IconButton(
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Cart(cart: cart, user: customer)));
                  }),
            if (customer.guest == false && customer.type == 'buyer')
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 5),
                          child: Container(
                            height: SizeConfig.screenHeight * 0.015,
                            width: SizeConfig.screenWidth * 0.15,
                            decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
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
                              '${customer.points.toString()}',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
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
            //ListView.builder(itemBuilder:,),
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
            if (history != null && history.isNotEmpty)
              Recommend(
                user: customer,
              ),

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
            if (products != null &&
                products.isNotEmpty &&
                customer.type == 'seller')
              for (var product in products)
                if (product.sid == customer.uid)
                  CardProduct(
                    customer: customer,
                    product: product,
                  ),
            if (products != null &&
                products.isNotEmpty &&
                customer.type == 'buyer')
              for (var product in products)
                CardProduct(
                  customer: customer,
                  product: product,
                ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: customer.type == 'seller'
            ? FloatingActionButton(
                // isExtended: true,

                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                backgroundColor: Colors.black,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CreateProduct(
                                user: customer,
                              )));
                },
              )
            : Container(),
      );

    return Loading();
  }
}
