import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/address.dart';
import 'package:flutter_app/Pages/cart.dart';
import '../Components/orders_items.dart';

class Orders extends StatefulWidget {
  static String routeName = "/Orders";
  Orders({this.orders});
  final orders;
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text('My Orders'),
      ),
      body: new ShopItemsWidget(orders: widget.orders),
    );
  }
}
