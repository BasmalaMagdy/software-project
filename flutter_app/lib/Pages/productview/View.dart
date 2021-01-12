import 'package:flutter/material.dart';
import 'package:flutter_app/Components/form_error.dart';
import 'package:flutter_app/models/user.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:flutter_app/bloc/cart_items_bloc.dart';
import 'package:flutter_app/Components/tabs.dart';

import '../comment.dart';
import '../../models/comment.dart';
import '../../models/product.dart';
import '../../services/database.dart';

class ViewBody extends StatefulWidget {
  ViewBody({Key key, this.product, this.snapshot}) : super(key: key);
  final ProductData product;
  var snapshot;

  @override
  _ViewBodyState createState() => _ViewBodyState();
}

class _ViewBodyState extends State<ViewBody> {
  double rating = 0.0;
  final _key = GlobalKey<FormState>();
  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  String CommentErrorNull = 'Error: Comment is empty';
  String comment;
  @override
  Widget build(BuildContext context) {
    final List<CommentData> comments = context.watch<List<CommentData>>();
    final UserData user = context.watch<UserData>();
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
                color: Colors.black,
              ),
              onPressed: () {}),
          new IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => tabAppBar()));
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
                  child: widget.snapshot.data,
                ),
                footer: new Container(
                  color: Colors.white70,
                  child: ListTile(
                    leading: new Text(
                      '${widget.product.name}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0),
                    ),
                    title: new Row(
                      children: <Widget>[
                        Expanded(
                            child:
                                //\$ to appear $
                                new Text(
                          '\$${widget.product.price.toString()}',
                          style: TextStyle(
                              color: Colors.grey,
                              decoration: TextDecoration
                                  .lineThrough), //lineTrough is the line one the old price
                        )),
                        Expanded(
                            child: new Text(
                          "\$${widget.product.price.toString()}",
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
                    child: new Text("Add to cart")),
              ),
              /*new IconButton(
                  icon: Icon(
                    Icons.add_shopping_cart,
                    color: Colors.red,
                  ),
                  onPressed: () =>
                      bloc.addToCart(widget.product) //product data stream

                  ),*/

              new IconButton(
                  icon: Icon(Icons.favorite_border),
                  color: Colors.red,
                  onPressed: () => bloc.addToFav(widget.product)),
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
                child: new Text('${widget.product.name}'),
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
                  title: Form(
                    key: _key,
                    child: Column(
                      children: [
                        TextFormField(
                          onSaved: (newValue) => comment = newValue,
                          validator: (value) {
                            if (value.isEmpty) {
                              addError(error: CommentErrorNull);
                              return "";
                            }
                            if (value.isNotEmpty) {
                              removeError(error: CommentErrorNull);
                            }
                            return null;
                          },
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
                        FormError(errors: errors),
                        InkWell(
                          onTap: () {
                            if (_key.currentState.validate()) {
                              _key.currentState.save();
                              DatabaseService().CreateProductComment(
                                  pid: widget.product.pid,
                                  user: user,
                                  comment: comment,
                                  rate: rating);
                            }
                          },
                          // ============= button  ===============
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
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (comments != null)
            for (var comment in comments) CommentCard(comment: comment),

          // for loop for comments
          /*for(int i = 0; i <comments.length; i++)
             {
               name : comments[i]['name'],
               content : comments[i]['content'],
             }*/
          //======================
        ],
      ),
    );
  }
}
