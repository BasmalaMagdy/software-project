import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';
import '../Components/Horizontal_listview.dart';
import '../Components/Product_card.dart';
import '../Components/Search.dart';
import '../Pages/createproduct/createproduct.dart';
import '../Pages/profile.dart';

class SellerInterface extends StatefulWidget {
  static String routeName = "/seller";
  SellerInterface({Key key}) : super(key: key);

  @override
  _SellerInterfaceState createState() => _SellerInterfaceState();
}

class _SellerInterfaceState extends State<SellerInterface> {
  Map basmala = {
    'account': 'basmala@gmail.com',
    'name': 'basmala',
    'phone': '+201141111111',
    'photo': 'girl_profile.jpg',
    'type': 'seller',
    'sid': 'sid'
  };

  @override
  Widget build(BuildContext context) {
    final List<ProductData> products = context.watch<List<ProductData>>();

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Fetch",
              style: TextStyle(color: Colors.black),
            ),
            Icon(Icons.location_on),
          ],
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()));
              }),
        ],
      ),
      /*************Drawer************ */
      /*drawer: SideList(
        user: seller,
        products: products,
      ),*/
      /************************* */
      body: ListView(
        children: [
          SearchField(),

          new Padding(
            padding: const EdgeInsets.all(4.0),
            // title for the categoties part
            child: new Text(
              'Categories',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
          //   horizontal list of the categories
          HorizontalList(),

          // Grid View of Products
          new Padding(
            padding: const EdgeInsets.all(12.0),
            // title for the categoties part
            child: new Text(
              'All products',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
          for (var product in products)
            CardProduct(
              product: product,
            ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        // isExtended: true,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CreateProduct()));
        },
      ),
    );
  }
}
