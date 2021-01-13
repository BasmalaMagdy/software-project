//the cart page the top bar and the total price and the check button
//the body is the choosen items displayed in cards the user can change the quantity of each item
// this is linked to product_view.dart and home.dart
import 'package:flutter/material.dart';
import '../Components/wishlist_items.dart';

class wishlist extends StatefulWidget {
  static String routeName = "/wishlist";
  wishlist({this.w});
  final w;
  @override
  _wishlistState createState() => _wishlistState();
}

class _wishlistState extends State<wishlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text('Wishlist'),
      ),
      body: new ShopItemsWidget(w: widget.w),
    );
  }
}
