import '../Pages/View.dart';
import '../models/product.dart';
import '../services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  final ProductData product;

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
    return StreamProvider(
      create: (context) =>
          context.read<DatabaseService>().comments(pid: widget.product.pid),
      child: ViewBody(product: widget.product),
    ); //has many properties which are handy such as appbar
  }
}
