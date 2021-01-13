import 'package:flutter_app/common/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../bloc/cart_items_bloc.dart';

class ShopItemsWidget extends StatefulWidget {
  ShopItemsWidget({this.orders});
  final orders;
  @override
  _ShopItemsWidgetState createState() => _ShopItemsWidgetState();
}

class _ShopItemsWidgetState extends State<ShopItemsWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.orders.length,
      itemBuilder: (context, index) => Card(
        child: ListTile(
          subtitle: new Column(
            children: <Widget>[
              new Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: new Text(
                      "Payment method:",
                      style: TextStyle(fontSize: SizeConfig.screenWidth * 0.02),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: new Text(
                      "${widget.orders[0].paymentmethod}",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: SizeConfig.screenWidth * 0.02),
                    ),
                  ),
                  new Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                    child: new Text(
                      "Currency:",
                      style: TextStyle(fontSize: SizeConfig.screenWidth * 0.02),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: new Text(
                      "${widget.orders[0].currency}",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: SizeConfig.screenWidth * 0.02),
                    ),
                  ),
                  new Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                    child: new Text(
                      "Total payment:",
                      style: TextStyle(fontSize: SizeConfig.screenWidth * 0.02),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: new Text(
                      "\$${widget.orders[0].total}",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: SizeConfig.screenWidth * 0.02),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
