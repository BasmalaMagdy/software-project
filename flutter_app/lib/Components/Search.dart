import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/productview/product_view.dart';
import 'package:flutter_app/models/product.dart';
import 'package:provider/provider.dart';

import '../services/storage.dart';

class DataSearch extends SearchDelegate<String> {
  final cities = ['Egypt', 'Argen', 'samy', "ahmed"];
  final recentcities = ['Egypt', 'samy'];

  DataSearch({this.products});
  final List<ProductData> products;
  List<ProductData> history = List<ProductData>();
//********************For Filter (Not working yet)****************** */
  /*
  Item selectedUser;
  List<Item> users = <Item>[
    const Item('all'),
    const Item('Shirt'),
    const Item('Dress'),
    const Item('Formal'),
    const Item('Informal'),
    const Item('Jeans'),
    const Item('Shoes'),
  ];*/

  @override
  List<Widget> buildActions(BuildContext context) {
    // Action for app bar
    //throw UnimplementedError();
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon on the left of the app bar
    //throw UnimplementedError();
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // Tshow some result based on the selection
    //throw UnimplementedError();
    return buildSuggestions(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches for something
    //throw UnimplementedError();
    /*final suggestionList = query.isEmpty
        ? recentcities
        : cities.where((p) => p.startsWith(query)).toList();*/
    List<ProductData> suggest = List<ProductData>();

    /*
    if (selectedUser != null)
      for (var product in products)
        if (product.name.startsWith(query) &&
            product.category.toLowerCase() == selectedUser.name.toLowerCase())
          suggest.add(product);
    */
    for (var product in products)
      if (product.name.startsWith(query)) suggest.add(product);

    return ListView(
      children: [
        if (suggest != null)
          for (var product in suggest) Suggest(context, product),

        /*ListView.builder(
              itemCount: suggest.length,
              itemBuilder: (context, index) {
                return;
              }),*/
        //********************For Filter (Not working yet)****************** */
        /*

        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Align(
            alignment: Alignment.center,
            child: DropdownButton(
              hint: Text("Select Category"),
              onChanged: (value) => selectedUser = value,
              value: selectedUser,
              style: TextStyle(
                  color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),

              items: users.map((user) {
                return DropdownMenuItem<Item>(
                  value: user,
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        user.name,
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                );
              }).toList(),
              //onSaved: (newValue) => selectedUser = newValue,
              //onChanged: sset,
              /*validator: (value) {
                if (value.name == 'Default') {
                  addError(error: kProductCategoryNullError);
                  return "";
                } else {
                  removeError(error: kProductCategoryNullError);
                }
                return null;
              },*/
              /* items: users.map((Item user) {
                return DropdownMenuItem<Item>(
                  value: user,
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        user.name,
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                );
              }).toList(),*/
            ),
          ),
        ),
        */
      ],
    );
  }

  Widget Suggest(context, product) {
    return FutureBuilder(
      future: getImage(context, 'Products/${product.name}/${product.photo}'),
      builder: (context, snapshot) {
        return ListTile(
          onTap: () {
            history.add(product);
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => Product(
                          product: product,
                          snapshot: snapshot,
                        )));
            //showResults(context);
          },
          //leading: Icon(Icons.location_city),
          //title: Text(suggestionList[index]),
          title: Text(product.name),
        );
      },
    );
  }
}

class SearchField extends StatelessWidget {
//Widget SearchField(BuildContext context) {
  const SearchField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ProductData> products = context.watch<List<ProductData>>();
    return GestureDetector(
      onTap: () {
        showSearch(context: context, delegate: DataSearch(products: products));
      },
      child: Container(
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 20),
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.search),
            Container(
              child: Text("Search Products"),
            ),
            Icon(Icons.filter_list),
          ],
        ),
      ),
    );
  }
}
