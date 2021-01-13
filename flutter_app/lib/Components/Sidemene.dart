import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/vip.dart';
import 'package:flutter_app/models/product.dart';
import 'package:flutter_app/services/auth.dart';
import 'package:provider/provider.dart';

import '../Pages/Seller.dart';
import '../Pages/about.dart';
import '../Pages/category.dart';
import '../Pages/profile.dart';
import '../Pages/settings.dart';
import '../Pages/test.dart';
import '../models/user.dart';
import '../services/storage.dart';

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
    List<ProductData> products = context.watch<List<ProductData>>();
    List<SearchProductData> history = context.watch<List<SearchProductData>>();
    print(customer.guest);
    print(customer.type);
    print(customer.vip);

    if (customer.guest == false &&
        customer.type == 'buyer' &&
        customer.photo != '')
      return Drawer(
        child: FutureBuilder(
            future: getProfileImage(
                context, 'Users/${customer.uid}/${customer.photo}'),
            builder: (context, snapshot) {
              return ListView(
                children: <Widget>[
                  //            header
                  UserAccountsDrawerHeader(
                    accountName: Text('${customer.name}'),
                    accountEmail: Text('${customer.email}'),
                    currentAccountPicture: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Profile(user: customer)));
                      },
                      child: snapshot.data,
                    ),
                    decoration: new BoxDecoration(
                      color: Colors.grey,
                    ),
                  ),

//              Body

                  if (customer.vip == false)
                    ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Vip(user: customer)));
                      },
                      title: Row(
                        children: [
                          Text(
                            'Update to vip account',
                            style: TextStyle(
                              color: Colors.amber,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                        ],
                      ),
                      leading: Icon(
                        Icons.person,
                        color: Colors.amber,
                      ),
                    ),

                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Profile(user: customer)));
                    },
                    title: customer.vip
                        ? Text(
                            'My Account',
                            style: TextStyle(
                              color: Colors.amberAccent,
                            ),
                          )
                        : Text('My Account'),
                    leading: customer.vip
                        ? Icon(
                            Icons.person,
                            color: Colors.amberAccent,
                          )
                        : Icon(Icons.person),
                  ),

                  ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Screen2()));
                    },
                    title: Text('My Orders'),
                    leading: Icon(Icons.shopping_basket),
                  ),

                  ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Screen2()));
                    },
                    title: Text('Favourite'),
                    leading: Icon(Icons.favorite),
                  ),

                  Divider(),

                  new Padding(
                    padding: const EdgeInsets.all(4.0),
                    // title for the categoties part
                    child: new Text('Categories'),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CategoryView(
                                    user: customer,
                                    products: products,
                                    category: 'Shirt',
                                  )));
                    },
                    title: Text('Shirt'),
                    leading: Icon(Icons.dashboard),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CategoryView(
                                    user: customer,
                                    products: products,
                                    category: 'accessories',
                                  )));
                    },
                    title: Text('Accessories'),
                    leading: Icon(Icons.dashboard),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CategoryView(
                                    user: customer,
                                    products: products,
                                    category: 'dress',
                                  )));
                    },
                    title: Text('Dress'),
                    leading: Icon(Icons.dashboard),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CategoryView(
                                    user: customer,
                                    products: products,
                                    category: 'formal',
                                  )));
                    },
                    title: Text('Formal'),
                    leading: Icon(Icons.dashboard),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CategoryView(
                                    user: customer,
                                    products: products,
                                    category: 'informal',
                                  )));
                    },
                    title: Text('Informal'),
                    leading: Icon(Icons.dashboard),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CategoryView(
                                    user: customer,
                                    products: products,
                                    category: 'jeans',
                                  )));
                    },
                    title: Text('Jeans'),
                    leading: Icon(Icons.dashboard),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CategoryView(
                                    user: customer,
                                    products: products,
                                    category: 'shoes',
                                  )));
                    },
                    title: Text('Shoes'),
                    leading: Icon(Icons.dashboard),
                  ),

                  Divider(),

                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Settings(user: customer, history: history)));
                    },
                    title: Text('Settings'),
                    leading: Icon(
                      Icons.settings,
                      color: Colors.red,
                    ),
                  ),

                  ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => About()));
                    },
                    title: Text('About'),
                    leading: Icon(
                      Icons.help,
                      color: Colors.red,
                    ),
                  ),
                  ListTile(
                    onTap: () async {
                      //await widget.auth.signOut();
                      await context.read<AuthService>().signOut();
                    },
                    title: Text('Sign out'),
                    leading: Icon(
                      Icons.exit_to_app,
                      color: Colors.red,
                    ),
                  ),
                ],
              );
            }),
      );
    else
      return Drawer(
        child: ListView(
          children: <Widget>[
            //            header
            UserAccountsDrawerHeader(
              accountName: Text('${customer.name}'),
              accountEmail: Text('${customer.email}'),
              currentAccountPicture: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Profile(user: customer)));
                },
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                ),
              ),
              decoration: new BoxDecoration(
                color: Colors.grey,
              ),
            ),

//              Body

            if (customer.vip == false &&
                customer.type == 'buyer' &&
                customer.guest == false)
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Vip(user: customer)));
                },
                title: Row(
                  children: [
                    Text(
                      'Update to vip account',
                      style: TextStyle(
                        color: Colors.amber,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                  ],
                ),
                leading: Icon(
                  Icons.person,
                  color: Colors.amber,
                ),
              ),
            if (customer.guest == false)
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Profile(user: customer)));
                },
                title: customer.vip
                    ? Text(
                        'My Account',
                        style: TextStyle(
                          color: Colors.amberAccent,
                        ),
                      )
                    : Text('My Account'),
                leading: customer.vip
                    ? Icon(
                        Icons.person,
                        color: Colors.amberAccent,
                      )
                    : Icon(Icons.person),
              ),

            Divider(),

            new Padding(
              padding: const EdgeInsets.all(4.0),
              // title for the categoties part
              child: new Text('Categories'),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CategoryView(
                              user: customer,
                              products: products,
                              category: 'Shirt',
                            )));
              },
              title: Text('Shirt'),
              leading: Icon(Icons.dashboard),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CategoryView(
                              user: customer,
                              products: products,
                              category: 'accessories',
                            )));
              },
              title: Text('Accessories'),
              leading: Icon(Icons.dashboard),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CategoryView(
                              user: customer,
                              products: products,
                              category: 'dress',
                            )));
              },
              title: Text('Dress'),
              leading: Icon(Icons.dashboard),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CategoryView(
                              user: customer,
                              products: products,
                              category: 'formal',
                            )));
              },
              title: Text('Formal'),
              leading: Icon(Icons.dashboard),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CategoryView(
                              user: customer,
                              products: products,
                              category: 'informal',
                            )));
              },
              title: Text('Informal'),
              leading: Icon(Icons.dashboard),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CategoryView(
                              user: customer,
                              products: products,
                              category: 'jeans',
                            )));
              },
              title: Text('Jeans'),
              leading: Icon(Icons.dashboard),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CategoryView(
                              user: customer,
                              products: products,
                              category: 'shoes',
                            )));
              },
              title: Text('Shoes'),
              leading: Icon(Icons.dashboard),
            ),

            Divider(),

            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Settings(user: customer, history: history)));
              },
              title: Text('Settings'),
              leading: Icon(
                Icons.settings,
                color: Colors.red,
              ),
            ),

            ListTile(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => About()));
              },
              title: Text('About'),
              leading: Icon(
                Icons.help,
                color: Colors.red,
              ),
            ),
            //if (customer.guest == false)
            ListTile(
              onTap: () async {
                //await widget.auth.signOut();
                await context.read<AuthService>().signOut();
              },
              title: Text('Sign out'),
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.red,
              ),
            ),
          ],
        ),
      );
  }
}
