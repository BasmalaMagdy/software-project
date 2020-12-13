import 'package:flutter/material.dart';
import 'package:flutter_app/Components/Products.dart';

//press stl to appear this class
/* class Product extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Text('pooooo',style: TextStyle(color: Colors.white),),
    );
  }
} */
//stf
class Product extends StatefulWidget {
  final Product_detail_name;
  final Product_detail_new_price;
  final Product_detail_old_price;
  final Product_detail_picture;

  //constractor
  Product({
    this.Product_detail_name,
    this.Product_detail_new_price,
    this.Product_detail_old_price,
    this.Product_detail_picture,
  });

  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1, //el shadow lel list
        backgroundColor: Colors.white12,
        title: Text('Drop'), //app name
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.share,
                color: Colors.white,
              ),
              onPressed: () {}),
          new IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {})
        ],
      ),
      //dropdown list
      /* drawer: new Drawer(
       child: new ListView( //child has many widget of children
         children: <Widget>[
           
         ],
       ), 
      ),
  */
      //listview to scroll
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 300.0,
            child: GridTile(
                child: Container(
                  color: Colors.white,
                  child: Image.asset(widget.Product_detail_picture),
                ),
                footer: new Container(
                  color: Colors.white70,
                  child: ListTile(
                    leading: new Text(
                      widget.Product_detail_name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0),
                    ),
                    title: new Row(
                      children: <Widget>[
                        Expanded(
                            child:
                                //\$ to appear $
                                new Text(
                          "\$${widget.Product_detail_old_price}",
                          style: TextStyle(
                              color: Colors.grey,
                              decoration: TextDecoration
                                  .lineThrough), //lineTrough is the line one the old price
                        )),
                        Expanded(
                            child: new Text(
                          "\$${widget.Product_detail_new_price}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                              decoration: TextDecoration.lineThrough),
                        )),
                      ],
                    ),
                  ),
                )),
          ),

          //===================the first buttons=============

          Row(
            children: <Widget>[
              //=========the size button------
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    //saying to show that dialog in the context of the widget
                    showDialog(
                        context: context,
                        builder: (context) {
                          return new AlertDialog(
                            title: new Text("Size"),
                            content: new Text("choose the size"),
                            actions: <Widget>[
                              new MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: new Text("close"),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: new Text("Size")),
                      Expanded(child: new Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),

              //=========the color button------
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    //saying to show that dialog in the context of the widget
                    showDialog(
                        context: context,
                        builder: (context) {
                          return new AlertDialog(
                            title: new Text("Colors"),
                            content: new Text("choose a color"),
                            actions: <Widget>[
                              new MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: new Text("close"),
                              )
                            ],
                          );
                        });
                  },
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: new Text("Color")),
                      Expanded(child: new Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),

              //=========the size button------
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    //saying to show that dialog in the context of the widget
                    showDialog(
                        context: context,
                        builder: (context) {
                          return new AlertDialog(
                            title: new Text("Quantity"),
                            content: new Text("choose the quantity"),
                            actions: <Widget>[
                              new MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: new Text("close"),
                              )
                            ],
                          );
                        });
                  },
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: new Text("Quantity")),
                      Expanded(child: new Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),
            ],
          ),

          //===================the second buttons=============

          Row(
            children: <Widget>[
              //=========the size button------
              Expanded(
                child: MaterialButton(
                    onPressed: () {},
                    color: Colors.red,
                    textColor: Colors.white,
                    elevation: 0.2,
                    child: new Text("Buy now")),
              ),
              new IconButton(
                  icon: Icon(
                    Icons.add_shopping_cart,
                    color: Colors.red,
                  ),
                  onPressed: () {}),

              new IconButton(
                  icon: Icon(Icons.favorite_border),
                  color: Colors.red,
                  onPressed: () {}),
            ],
          ),
           Divider(),
          new ListTile(
            title: new Text("Product details"),
            subtitle: new Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
          ),
           Divider(),
           new Row(
             children: <Widget>[
               Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text("Product name", style: TextStyle(color: Colors.grey),),
               ),
                Padding(padding: EdgeInsets.all(5.0),
               child: new Text(widget.Product_detail_name),
               )
             ],
           ),

                new Row(
             children: <Widget>[
               Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text("Product brand", style: TextStyle(color: Colors.grey),),
               ),
                //   remember ading product brand
                Padding(padding: EdgeInsets.all(5.0),
               child: new Text("Brand x"),
               )
             ],
           ),

//  add the prod condition
               new Row(
             children: <Widget>[
               Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text("Product condition", style: TextStyle(color: Colors.grey),),
               ),

                 Padding(padding: EdgeInsets.all(5.0),
               child: new Text("New"),
               )
             ],
           )

        ],
      ),
    ); //has many properties which are handy such as appbar
  }
}
