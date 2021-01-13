import 'package:flutter_app/common/size_config.dart';
import 'package:flutter_app/services/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../services/storage.dart';

class ShopItemsWidget extends StatefulWidget {
  ShopItemsWidget({this.w});
  final w;
  @override
  _ShopItemsWidgetState createState() => _ShopItemsWidgetState();
}

class _ShopItemsWidgetState extends State<ShopItemsWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.w.length,
      itemBuilder: (context, index) => FutureBuilder(
          future: getImage(context,
              'Products/${widget.w[index].pid}/${widget.w[index].photo}'),
          builder: (context, snapshott) {
            return Card(
              child: ListTile(
                leading: Container(
                  child: snapshott.data,
                  width: 80.0,
                  height: 80.0,
                ),
                title: new Text("${widget.w[index].name}"),
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
                            "${widget.w[index].size}",
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
                            "${widget.w[index].color}",
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
                        "\$${widget.w[index].price.toString()}",
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
                              DatabaseService().DeleteWishlistData(
                                  wishlist: widget.w[index]);
                            },
                            //onPressed: () => bloc.removeFromCart(cartData)
                          ),
                          new IconButton(
                            icon: Icon(Icons.add_shopping_cart),
                            color: Colors.red,
                            onPressed: () {
                              DatabaseService().CreateUserCart(
                                color: widget.w[index].color,
                                name: widget.w[index].name,
                                photo: widget.w[index].photo,
                                pid: widget.w[index].pid,
                                pquantity: 1,
                                price: widget.w[index].price,
                                sid: widget.w[index].sid,
                                size: widget.w[index].size,
                                uid: widget.w[index].uid,
                              );
                            },
                            //onPressed: () => bloc.addToFav(cartData)
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
