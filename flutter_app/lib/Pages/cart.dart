//the cart page the top bar and the total price and the check button
//the body is the choosen items displayed in cards the user can change the quantity of each item
// this is linked to product_view.dart and home.dart
import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/address.dart';
import 'package:flutter_app/models/cart_database.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/services/database.dart';
import 'package:flutter_app/services/storage.dart';
import 'package:provider/provider.dart';
import '../Components/cart_items.dart';
import '../bloc/cart_items_bloc.dart';

class Cart extends StatefulWidget {
  static String routeName = "/cart";
  Cart({this.cart, this.user});
  final cart;
  final user;
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    print('********************I AM IN CART FILE **************');
    //print(cartData[0]);
    print(widget.user.uid);

    return MultiProvider(
      providers: [
        Provider<DatabaseService>(
          create: (_) => DatabaseService(uid: widget.user.uid),
        ),
        StreamProvider(
          create: (context) =>
              context.read<DatabaseService>().wishlist(uid: widget.user.uid),
        ),
        StreamProvider(
          create: (context) =>
              context.read<DatabaseService>().cart(uid: widget.user.uid),
        ),
        StreamProvider(
          create: (context) =>
              context.read<DatabaseService>().orders(uid: widget.user.uid),
        ),
        StreamProvider(
          create: (context) => context.read<DatabaseService>().Products,
        ),
        StreamProvider(
          create: (context) => context.read<DatabaseService>().Categories,
        ),
        StreamProvider(
          create: (context) => context.read<DatabaseService>().Users,
        ),
      ],
      child: Body(),
    );
  }
}

class Body extends StatefulWidget {
  Body({Key key, this.user}) : super(key: key);
  final user;
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    List<userCartData> cartData = context.watch<List<userCartData>>();
    UserData user = context.watch<UserData>();

    return cartData == null
        ? Loading()
        : Scaffold(
            appBar: new AppBar(
              elevation: 0.1,
              backgroundColor: Colors.red,
              centerTitle: true,
              title: Text('cart '),
            ),
            body: new ShopItemsWidget(cart: cartData),
            bottomNavigationBar: new Container(
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: new MaterialButton(
                      onPressed: cartData.isEmpty
                          ? null
                          : () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Address(cart: cartData, user: user)));
                            },
                      child: new Text(
                        "BUY ${Calculate(cartData)} ITEMS FOR EGP ${CalculateTotal(cartData)}",
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
