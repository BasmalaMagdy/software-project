import 'package:flutter/material.dart';
import 'package:flutter_app/common/size_config.dart';
import '../Pages/cart.dart';
import '../Pages/wishlist.dart';

class tabAppBar extends StatefulWidget {
  @override
  _tabAppBarState createState() => _tabAppBarState();
}

class _tabAppBarState extends State<tabAppBar> {
  final tabs = ['cart', 'fav'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red,
      ),
      body: DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          appBar: new AppBar(
            toolbarHeight: SizeConfig.screenHeight * 0.2,
            elevation: 0.1,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.red,
            bottom: TabBar(
              indicatorColor: Colors.white,
              isScrollable: true,
              tabs: [
                Tab(icon: Icon(Icons.shopping_cart), text: "Cart"),
                Tab(icon: Icon(Icons.favorite_border), text: "Wishlist"),
              ],
            ),
          ),
          body: TabBarView(
            children: [Cart(), Fav()],
          ),
        ),
      ),
    );
  }
}
