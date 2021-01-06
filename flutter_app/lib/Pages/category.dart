import '../models/product.dart';
import 'package:flutter/material.dart';
import '../Components/Product_card.dart';
import '../Components/Search.dart';
import '../Pages/test.dart';

class CategoryView extends StatefulWidget {
  static String routeName = "/category";
  CategoryView({Key key, this.products, this.category}) : super(key: key);
  final List<ProductData> products;
  final String category;
  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  Icon cusIcon = Icon(Icons.search, color: Colors.white);
  @override
  Widget build(BuildContext context) {
    //print(widget.products[0]['category']);
    //print(widget.category);
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Text(widget.category, style: TextStyle(color: Colors.black)),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Screen2()));
              }),
        ],
      ),

      /******************** */
      // drawer: SideList(),

      /******************** */
      body: ListView(
        children: [
          SearchField(),
          for (var product in widget.products)
            product.category == widget.category
                ? CardProduct(product: product)
                : Container(),
        ],
      ),
      /* ListView.builder(
        itemCount: widget.products.length,
        itemBuilder: (BuildContext context, int index) {
          if (widget.products[index]['category'] == widget.category) {
            return CardProduct(product: widget.products[index]);
          } else {
            return CardProduct(product: widget.products[index]);
          }
        },*/
      /*children: <Widget>[
          for (var product in widget.products) product['category'] == widget.category?CardProduct(product: product):,
           // if (product['category'] == widget.category)
           //   CardProduct(product: product),
           

        ],*/
    );
  }
}

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
