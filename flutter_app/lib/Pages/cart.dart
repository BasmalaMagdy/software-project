//the cart page the top bar and the total price and the check button
//the body is the choosen items displayed in cards the user can change the quantity of each item
// this is linked to product_view.dart and home.dart
import 'package:flutter/material.dart';
import 'package:flutter_app/Components/cart_items.dart';
import 'package:flutter_app/bloc/cart_items_bloc.dart';

class Cart extends StatefulWidget {
  static String routeName = "/cart";
  @override
  _CartState createState() => _CartState();
}
class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   appBar: new AppBar(
      //     elevation: 0.1,
      //     backgroundColor: Colors.red,
      //     centerTitle: true,
      //     title: Text('cart'),
      // ),
      body: new ShopItemsWidget(),
      bottomNavigationBar: new Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
              child: new MaterialButton(
                onPressed: () {
                  /* Navigator.push(context,
                      MaterialPageRoute(builder: (context) => new Checkout()));*/
                }, // a page need to be added
                child: new Text(
                  "BUY ${bloc.num()} ITEMS FOR EGP ${bloc.sum()}",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
