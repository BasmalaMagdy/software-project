// this is the card for each choosen item by the user 
// this is linked to cart.dart
// need alot of changes
import 'package:flutter/material.dart';
class Cart_items extends StatefulWidget {
  @override
  _Cart_itemsState createState() => _Cart_itemsState();
}

class _Cart_itemsState extends State<Cart_items> {
  var items_on_the_cart = [
    {
      "name": "Blazer",
      "price": 200,
      "photo": 'images/products/blazer1.jpeg',
      "size": "M",
      "color": "Red",
      "quantity": 1,
    },
    {
      "name": "Blazer",
      "price": 200,
      "photo": 'images/products/blazer1.jpeg',
      "size": "M",
      "color": "Red",
      "quantity": 1,
    },
    {
      "name": "Blazer",
      "price": 200,
      "photo": 'images/products/blazer1.jpeg',
      "size": "M",
      "color": "Red",
      "quantity": 1,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index){
          return new Single_cart_item(
            prod_name: items_on_the_cart[index]["name"],
            prod_color: items_on_the_cart[index]["color"],
            prod_qty: items_on_the_cart[index]["quantity"],
            prod_size: items_on_the_cart[index]["size"],
            prod_price: items_on_the_cart[index]["price"],
            prod_picture: items_on_the_cart[index]["photo"],
          );
        });
  }
}

class Single_cart_item extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_price;
  final prod_size;
  final prod_color;
  final prod_qty;

  Single_cart_item({
    this.prod_name,
    this.prod_picture,
    this.prod_price,
    this.prod_size,
    this.prod_color,
    this.prod_qty
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: new Image.asset(prod_picture, width:80.0, height: 80.0,),
        title: new Text(prod_name),
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
                  child: new Text(prod_size, style: TextStyle(color: Colors.red),),
                ),
                new Padding(padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                  child: new Text("Color:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: new Text(prod_color, style: TextStyle(color: Colors.red),),
                ),
              ],
            ),
            new Container(
              alignment: Alignment.topLeft,
              child: new Text("\$${prod_price}", style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
