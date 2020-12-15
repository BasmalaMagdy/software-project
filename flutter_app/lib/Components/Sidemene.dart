import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/profile1.dart';
import 'package:flutter_app/Pages/test.dart';

// ignore: must_be_immutable
class SideList extends StatefulWidget {
  const SideList({Key key, this.person}) : super(key: key);
  final Map person;

  @override
  _SideListState createState() => _SideListState();
}

class _SideListState extends State<SideList> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          //            header
          UserAccountsDrawerHeader(
            accountName: Text('${widget.person['name']}'),
            accountEmail: Text('${widget.person['account']}'),
            currentAccountPicture: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Profile(
                              person: widget.person,
                            )));
              },
              child: Stack(
                children: [
                  new CircleAvatar(
                    backgroundColor: Colors.black,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ),
                  new CircleAvatar(
                    backgroundImage:
                        AssetImage('images/${widget.person['photo']}'),
                  ),
                ],
              ),
            ),
            decoration: new BoxDecoration(
              color: Colors.grey,
            ),
          ),

//              Body
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Profile(
                            person: widget.person,
                          )));
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
                  context, MaterialPageRoute(builder: (context) => Screen2()));
            },
            child: ListTile(
              title: Text('Shirt'),
              leading: Icon(Icons.dashboard),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Screen2()));
            },
            child: ListTile(
              title: Text('Accessories'),
              leading: Icon(Icons.dashboard),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Screen2()));
            },
            child: ListTile(
              title: Text('Dress'),
              leading: Icon(Icons.dashboard),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Screen2()));
            },
            child: ListTile(
              title: Text('Formal'),
              leading: Icon(Icons.dashboard),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Screen2()));
            },
            child: ListTile(
              title: Text('Informal'),
              leading: Icon(Icons.dashboard),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Screen2()));
            },
            child: ListTile(
              title: Text('Jeans'),
              leading: Icon(Icons.dashboard),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Screen2()));
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
                  context, MaterialPageRoute(builder: (context) => Screen2()));
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
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Screen2()));
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
