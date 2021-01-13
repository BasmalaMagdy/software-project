//the cart page the top bar and the total price and the check button
//the body is the choosen items displayed in cards the user can change the quantity of each item
// this is linked to product_view.dart and home.dart
import 'package:flutter/material.dart';
import 'package:flutter_app/models/wishlist_database.dart';
import 'package:flutter_app/services/database.dart';
import 'package:flutter_app/services/storage.dart';
import 'package:provider/provider.dart';
import '../Components/wishlist_items.dart';

class wishlist extends StatefulWidget {
  static String routeName = "/wishlist";
  wishlist({this.w, this.user});
  final user;
  final w;
  @override
  _wishlistState createState() => _wishlistState();
}

class _wishlistState extends State<wishlist> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<DatabaseService>(
          create: (_) => DatabaseService(uid: widget.user.uid),
        ),
        StreamProvider(
          create: (context) =>
              context.read<DatabaseService>().history(uid: widget.user.uid),
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
  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    List<userWishlistData> w = Provider.of<List<userWishlistData>>(context);
    return w == null
        ? Loading()
        : Scaffold(
            appBar: new AppBar(
              elevation: 0.1,
              backgroundColor: Colors.red,
              centerTitle: true,
              title: Text('Wishlist'),
            ),
            body: new ShopItemsWidget(w: w),
          );
  }
}
