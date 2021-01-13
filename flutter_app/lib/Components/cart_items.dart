// this is the card for each choosen item by the user
// this is linked to cart.dart
// add comments
import 'package:flutter_app/common/size_config.dart';
import 'package:flutter_app/models/product.dart';
import 'package:flutter_app/services/database.dart';
import 'package:provider/provider.dart';
import '../models/cart_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../services/storage.dart';

class ShopItemsWidget extends StatefulWidget {
  ShopItemsWidget({this.cart});
  final cart;
  @override
  _ShopItemsWidgetState createState() => _ShopItemsWidgetState();
}

class _ShopItemsWidgetState extends State<ShopItemsWidget> {
  @override
  Widget build(BuildContext context) {
    // List<userCartData> cartData = context.watch<List<userCartData>>();
    return ListView.builder(
      itemCount: widget.cart.length,
      itemBuilder: (context, index) => FutureBuilder(
          future: getImage(context,
              'Products/${widget.cart[index].pid}/${widget.cart[index].photo}'),
          builder: (context, snapshott) {
            return Card(
              child: ListTile(
                leading: Container(
                  child: snapshott.data,
                  width: 80.0,
                  height: 80.0,
                ),

                /*new Image.asset(
                    'images/cats/${cartList[i].photo}', //================================photo====================================================

                  ),*/
                title: new Text(
                    "${widget.cart[index].name}"), //==========================================name====================================================
                subtitle: new Column(
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: new Text(
                            "Size:",
                            style: TextStyle(
                                fontSize: SizeConfig.screenWidth * 0.02),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: new Text(
                            "${widget.cart[index].size}", //================================================size=====================================================
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: SizeConfig.screenWidth * 0.02),
                          ),
                        ),
                        new Padding(
                          padding:
                              const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                          child: new Text(
                            "Color:",
                            style: TextStyle(
                                fontSize: SizeConfig.screenWidth * 0.02),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: new Text(
                            "${widget.cart[index].color}", //========================================================color=============================================
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: SizeConfig.screenWidth * 0.02),
                          ),
                        ),
                      ],
                    ),
                    new Container(
                      alignment: Alignment.topLeft,
                      child: new Text(
                        "\$${widget.cart[index].price.toString()}", //======================================================price====================================================
                        style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          new IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              print('Delete ***************');
                              DatabaseService()
                                  .DeletecartData(cart: widget.cart[index]);
                            },
                            //onPressed: () => bloc.removeFromCart(cartData)//product data stream
                          ),
                          new IconButton(
                            icon: Icon(Icons.favorite_border),
                            color: Colors.red,
                            //onPressed: () => bloc.addToFav(cartData) //product data stream
                          ),
                        ]),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
