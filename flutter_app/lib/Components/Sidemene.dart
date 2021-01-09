import '../models/product.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../Pages/Seller.dart';
import '../Pages/about.dart';
import '../Pages/category.dart';
import '../Pages/profile.dart';
import '../Pages/test.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';

// ignore: must_be_immutable
class SideList extends StatefulWidget {
  const SideList({
    Key key,
  }) : super(key: key);

  @override
  _SideListState createState() => _SideListState();
}

class _SideListState extends State<SideList> {
  @override
  Widget build(BuildContext context) {
    UserData customer = context.watch<UserData>();

    return Drawer(
      child: new ListView(
        children: <Widget>[
          //            header
          UserAccountsDrawerHeader(
            accountName: Text('${customer.name}'),
            accountEmail: Text('${customer.email}'),
            currentAccountPicture: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()));
              },
              child: new CircleAvatar(
                backgroundImage: AssetImage('images/${customer.photo}'),
                /*backgroundColor: Colors.black,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),*/
              ),
            ),
            decoration: new BoxDecoration(
              color: Colors.grey,
            ),
          ),

//              Body
          Divider(
            thickness: 5,
            color: Colors.black,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SellerInterface()));
            },
            child: ListTile(
              title: Text('Test Seller interface'),
              leading: Icon(Icons.person),
            ),
          ),

          Divider(
            height: 20,
            thickness: 5,
            color: Colors.black,
          ),

          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Profile()));
            },
            child: ListTile(
              title: Text('My Account'),
              leading: Icon(Icons.person),
            ),
          ),

          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Screen2()));
            },
            child: ListTile(
              title: Text('My Orders'),
              leading: Icon(Icons.shopping_basket),
            ),
          ),

          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Screen2()));
            },
            child: ListTile(
              title: Text('Favourite'),
              leading: Icon(Icons.favorite),
            ),
          ),

          Divider(),

          new Padding(
            padding: const EdgeInsets.all(4.0),
            // title for the categoties part
            child: new Text('Categories'),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CategoryView(
                            category: 'Shirt',
                          )));
            },
            child: ListTile(
              title: Text('Shirt'),
              leading: Icon(Icons.dashboard),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CategoryView(
                            category: 'accessories',
                          )));
            },
            child: ListTile(
              title: Text('Accessories'),
              leading: Icon(Icons.dashboard),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CategoryView(
                            category: 'dress',
                          )));
            },
            child: ListTile(
              title: Text('Dress'),
              leading: Icon(Icons.dashboard),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CategoryView(
                            category: 'formal',
                          )));
            },
            child: ListTile(
              title: Text('Formal'),
              leading: Icon(Icons.dashboard),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CategoryView(
                            category: 'informal',
                          )));
            },
            child: ListTile(
              title: Text('Informal'),
              leading: Icon(Icons.dashboard),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CategoryView(
                            category: 'jeans',
                          )));
            },
            child: ListTile(
              title: Text('Jeans'),
              leading: Icon(Icons.dashboard),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CategoryView(
                            category: 'shoes',
                          )));
            },
            child: ListTile(
              title: Text('Shoes'),
              leading: Icon(Icons.dashboard),
            ),
          ),

          Divider(),

          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Screen2()));
            },
            child: ListTile(
              title: Text('Settings'),
              leading: Icon(
                Icons.settings,
                color: Colors.red,
              ),
            ),
          ),

          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => About()));
            },
            child: ListTile(
              title: Text('About'),
              leading: Icon(
                Icons.help,
                color: Colors.red,
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              //await widget.auth.signOut();
            },
            child: ListTile(
              title: Text('Sign out'),
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
