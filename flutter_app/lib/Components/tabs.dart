import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/cart.dart';
import 'package:flutter_app/Pages/wishlist.dart';
class tabAppBar extends StatefulWidget {
  @override
  _tabAppBarState createState() => _tabAppBarState();
}

class _tabAppBarState extends State<tabAppBar> {
  final tabs = ['cart', 'fav'];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: new AppBar(
          elevation: 0.1,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.red,
          bottom: TabBar(
            indicatorColor: Colors.white,
            isScrollable: true,
            tabs: [
              Tab(icon: Icon(Icons.shopping_cart), text:"Cart"),
              Tab(icon: Icon(Icons.favorite_border), text: "Wishlist"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
              Cart(),
              Fav()
          ],
        ),
      ),
    );
  }
}
