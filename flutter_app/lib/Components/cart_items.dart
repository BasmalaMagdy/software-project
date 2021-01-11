// this is the card for each choosen item by the user
// this is linked to cart.dart
// add comments
import 'package:flutter/material.dart';
import '../bloc/cart_items_bloc.dart';
import '../services/storage.dart';

//check if the cart is empty or not
class ShopItemsWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: bloc.allItems,
      stream: bloc.getStream,
      builder: (context, snapshot) {
        return snapshot.data["cart items"].length > 0
            ? shopItemsListBuilder(snapshot)
            : Center(child: Text("You haven't taken any item yet"));
      },
    );
  }

  Widget shopItemsListBuilder(snapshot) {
    return ListView.builder(
      itemCount: snapshot.data["cart items"].length,
      itemBuilder: (BuildContext context, i) {
        final cartList = snapshot.data["cart items"];
        return FutureBuilder(
            future: getImage(
                context, 'Products/${cartList[i].name}/${cartList[i].photo}'),
            builder: (context, snapshott) {
              return Card(
                child: ListTile(
                  leading: snapshott.data,
                  /*new Image.asset(
                    'images/cats/${cartList[i].photo}', //================================photo====================================================
                    width: 80.0,
                    height: 80.0,
                  ),*/
                  title: new Text(cartList[i]
                      .name), //==========================================name====================================================
                  subtitle: new Column(
                    children: <Widget>[
                      new Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: new Text("Size:"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: new Text(
                              cartList[i]
                                  .size, //================================================size=====================================================
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                          new Padding(
                            padding:
                                const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                            child: new Text("Color:"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: new Text(
                              cartList[i]
                                  .color, //========================================================color=============================================
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                      new Container(
                        alignment: Alignment.topLeft,
                        child: new Text(
                          "\$${cartList[i].price.toString()}", //======================================================price====================================================
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
                              onPressed: () => bloc.removeFromCart(cartList[i])//product data stream

                          ),

                          new IconButton(
                              icon: Icon(Icons.favorite_border),
                              color: Colors.red,
                              onPressed: () => bloc.addToFav(cartList[i]) //product data stream
                          ),
                        ]
                      ),
                    ],
                  ),
                ),
              );
            });
      },
    );
  }
}
