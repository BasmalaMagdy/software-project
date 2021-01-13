import 'package:flutter_app/models/user.dart';

import 'View.dart';
import '../../models/product.dart';
import '../../services/database.dart';
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
  Product({Key key, this.product, this.snapshot, this.user}) : super(key: key);
  final ProductData product;
  final UserData user;
  var snapshot;

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
    return MultiProvider(
      providers: [
        Provider<DatabaseService>(
          create: (_) => DatabaseService(uid: widget.user.uid),
        ),
        StreamProvider(
          create: (context) =>
              context.read<DatabaseService>().comments(pid: widget.product.pid),
        ),
        StreamProvider(
          create: (context) => context.read<DatabaseService>().Users,
        ),
      ],
      child: ViewBody(
        user: widget.user,
        product: widget.product,
        snapshot: widget.snapshot,
      ),
    ); //has many properties which are handy such as appbar
  }
}
