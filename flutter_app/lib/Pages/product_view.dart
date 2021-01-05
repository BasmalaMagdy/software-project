//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/cart.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

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
  static String routeName = "/productview";
  Product({Key key, this.product}) : super(key: key);
  final Map product;

  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  double rating = 0.0; // var to print rating

  //=========== lists of comments ===========
  List comments = [
    {'name': "nemo", "content": "hfgfdjcgfegvcdhfvf"},
    {'name': "mard", "content": "hfgfdjcgfegvcdhfvf"},
    {'name': "dori", "content": "hfgfdjcgfegvcdhfvf"},
  ];
  @override
  Widget build(BuildContext context) {
    //product = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.white12,
        iconTheme: new IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Text('Fetch'), //app name
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
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart()));
              })
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
                  child: Image.asset('images/cats/${widget.product['photo']}'),
                ),
                footer: new Container(
                  color: Colors.white70,
                  child: ListTile(
                    leading: new Text(
                      '${widget.product['name']}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0),
                    ),
                    title: new Row(
                      children: <Widget>[
                        Expanded(
                            child:
                                //\$ to appear $
                                new Text(
                          '\$${widget.product['oldprice']}',
                          style: TextStyle(
                              color: Colors.grey,
                              decoration: TextDecoration
                                  .lineThrough), //lineTrough is the line one the old price
                        )),
                        Expanded(
                            child: new Text(
                          "\$${widget.product['price']}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            /*decoration: TextDecoration.lineThrough*/
                          ),
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

              //=========the Quantity button------
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

          //===================================
          Divider(),
          new ListTile(
            title: new Text("Product details"),
            subtitle: new Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
          ),
          Divider(),
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text(
                  "Product name",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: new Text('${widget.product['name']}'),
              )
            ],
          ),
//=============================================
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text(
                  "Product brand",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              //   remember adding product brand
              Padding(
                padding: EdgeInsets.all(5.0),
                child: new Text("Brand x"),
              )
            ],
          ),

//  add the prod condition
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text(
                  "Product condition",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: new Text("New"),
              )
            ],
          ),
//====================rating==============================
          Divider(),
          new Row(
            children: <Widget>[
              SmoothStarRating(
                starCount: 5,
                isReadOnly: false, // can changr rating or not
                spacing: 2,
                rating: 4,
                size: 30,
                color: Colors.yellow[700],
                borderColor: Colors.yellow[800],
                //=====print product rating in terminal====
                onRated: (value) {
                  setState(() {
                    rating = value;
                    print("Rating is : $rating");
                  });
                },
                //============
              ),
            ],
          ),

          //====================comments=========
          Divider(),
          new ListTile(
            title: new Text("Reviews"),
          ),
          //  ============ write your revirw=============
          Card(
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  title: TextFormField(
                    maxLength: 255,
                    maxLines: 10,
                    minLines: 1,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      hintText: "write your review",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                //========== button =========
                Row(
                  children: <Widget>[
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                            color: Colors.blueGrey.withOpacity(0.2),
                          ))),
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment
                                .center, // make button in center
                            children: <Widget>[
                              Text(
                                "Add",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.grey[600], fontSize: 17),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 10),
                              ),
                              Icon(
                                Icons.add_box,
                                color: Colors.grey,
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),

          Card(
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  title: Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text("Name"),
                  ),
                  //trailing: Icon(Icon.filter_list),
                  isThreeLine: true,
                  subtitle: Text("vhdgfnhvhgffgddfdfj hjhgfhdfd"),
                ),
                Divider(
                  color: Colors.grey.withOpacity(0.5),
                ),
                //=================like and comment======================
                new Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.thumb_up,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              "Like",
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        padding: EdgeInsets.only(top: 5, bottom: 5),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.comment,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              "comment",
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        padding: EdgeInsets.only(top: 5, bottom: 5),
                      ),
                    ),
                  ],
                ),
                //============================================
              ],
            ),
          ),
          // for loop for comments
          /*for(int i = 0; i <comments.length; i++)
           {
             name : comments[i]['name'],
             content : comments[i]['content'],
           }*/
          //======================
        ],
      ),
    ); //has many properties which are handy such as appbar
  }
}
