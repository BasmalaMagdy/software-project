import 'package:flutter_app/models/user.dart';

import '../models/product.dart';
import 'package:flutter/material.dart';
import '../Components/Product_card.dart';
import '../Components/Search.dart';
import '../Pages/test.dart';
import 'package:provider/provider.dart';

class CategoryView extends StatefulWidget {
  static String routeName = "/category";
  CategoryView({Key key, this.category, this.products, this.user})
      : super(key: key);
  final String category;
  final List<ProductData> products;
  final UserData user;
  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  Icon cusIcon = Icon(Icons.search, color: Colors.white);
  @override
  Widget build(BuildContext context) {
    //final List<ProductData> products = context.watch<List<ProductData>>();
    //final UserData user = context.watch<UserData>();

    //print(widget.products[0]['category']);
    //print(widget.category);
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Text(widget.category, style: TextStyle(color: Colors.black)),
      ),
      body: ListView(
        children: [
          if (widget.user.type == 'seller')
            for (var product in widget.products)
              if (product.sid == widget.user.uid &&
                  product.category == widget.category)
                CardProduct(product: product, customer: widget.user),
          if (widget.user.type == 'buyer')
            for (var product in widget.products)
              if (product.category == widget.category)
                CardProduct(product: product, customer: widget.user),
        ],
      ),
    );
  }
}

/*
// fixed search bar
class SearchFieldd extends StatelessWidget {
  const SearchFieldd({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0, left: 70, right: 70),
      child: Material(
        elevation: 3.0,
        borderRadius: BorderRadius.circular(30.0),
        child: TextField(
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 32.0, vertical: 14),
            hintText: "Search...",
            suffixIcon: Icon(
              Icons.search,
              color: Colors.grey,
            ), //Icon
            border: InputBorder.none,
          ), //InputDecoration
        ), //TextField
      ), //Material
    ); //Container
  }
}
*/
