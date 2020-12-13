import 'package:flutter/material.dart';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter_app/Components/Horizontal_listview.dart';
import 'package:flutter_app/Components/Products.dart';
import 'package:flutter_app/Components/Search.dart';
import 'package:flutter_app/Pages/test.dart';
import 'package:flutter_app/Pages/profile.dart';

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
          /* child: Text(
            widget.title,
            style: TextStyle(color: Colors.black),
          ),*/
        ),
        actions: <Widget>[
          /*IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () {}),*/
          IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ),
              onPressed: () {}),
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            //            header
            UserAccountsDrawerHeader(
              accountName: Text('Ahmed'),
              accountEmail: Text('ahmed@gmail.com'),
              currentAccountPicture: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Profile()));
                },
                child: new CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: new BoxDecoration(
                color: Colors.grey,
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
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()));
              },
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
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Sign out'),
                leading: Icon(
                  Icons.exit_to_app,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
      body: new ListView(
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

          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Products()));
            },
            child: Container(
              height: 240.0,
              child: Row(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.blueGrey[300],
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: ShadowList,
                          ),
                          margin: EdgeInsets.only(top: 40, left: 10),
                        ),
                        Align(
                          child: Image.asset(
                            'images/cats/accessories.png',
                            color: Colors.white,
                            height: 240,
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 70, bottom: 20, right: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: ShadowList,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      child: Column(
                        children: [Text('product 1'), Text('discription')],
                      ),
                    ),
                  )
                ],
              ),
              //child: Products(),
            ),
          ),
          //Flexible(child: Products()),
          GestureDetector(
            onTap: () {
               Navigator.push(
                context, MaterialPageRoute(builder: (context) => Products())); 
            },
            child: Container(
              height: 240.0,
              child: Row(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.blueGrey[300],
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: ShadowList,
                          ),
                          margin: EdgeInsets.only(top: 40, left: 10),
                        ),
                        Align(
                          child: Image.asset(
                            'images/cats/accessories.png',
                            color: Colors.white,
                            height: 240,
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 70, bottom: 20, right: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: ShadowList,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      child: Column(
                        children: [Text('product 1'), Text('discription')],
                      ),
                    ),
                  )
                ],
              ),
              //child: Products(),
            ),
          ),
          //Flexible(child: Products()),
          Container(
            height: 240.0,
            child: Row(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blueGrey[300],
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: ShadowList,
                        ),
                        margin: EdgeInsets.only(top: 40, left: 10),
                      ),
                      Align(
                        child: Image.asset(
                          'images/cats/accessories.png',
                          color: Colors.white,
                          height: 240,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 70, bottom: 20, right: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: ShadowList,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    child: Column(
                      children: [Text('product 1'), Text('discription')],
                    ),
                  ),
                )
              ],
            ),
            //child: Products(),
          ),
          //Flexible(child: Products()),
        ],
      ),
    );
  }
}
