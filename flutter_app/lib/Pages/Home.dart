import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter_app/Components/Horizontal_listview.dart';
import 'package:flutter_app/Components/Products.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        iconTheme: new IconThemeData(color: Colors.black),
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {})
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
//            header
            new UserAccountsDrawerHeader(
              accountName: Text('Ahmed'),
              accountEmail: Text('ahmed@gmail.com'),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: new BoxDecoration(
                color: Colors.blue,
              ),
            ),
//              Body
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('home page'),
                leading: Icon(Icons.home),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('My Account'),
                leading: Icon(Icons.person),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('My Orders'),
                leading: Icon(Icons.shopping_basket),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Favourite'),
                leading: Icon(Icons.favorite),
              ),
            ),

            Divider(),

            new Padding(
              padding: const EdgeInsets.all(4.0),
              // title for the categoties part
              child: new Text('Categories'),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Shirt'),
                leading: Icon(Icons.dashboard),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Accessories'),
                leading: Icon(Icons.dashboard),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Dress'),
                leading: Icon(Icons.dashboard),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Formal'),
                leading: Icon(Icons.dashboard),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Informal'),
                leading: Icon(Icons.dashboard),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Jeans'),
                leading: Icon(Icons.dashboard),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Shoes'),
                leading: Icon(Icons.dashboard),
              ),
            ),

            Divider(),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(
                  Icons.settings,
                  color: Colors.red,
                ),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('About'),
                leading: Icon(
                  Icons.help,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
      body: new ListView(
        children: [
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
          Container(
            height: 320.0,
            child: Products(),
          )
          //Flexible(child: Products()),
        ],
      ),
    );
  }
}
