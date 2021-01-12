import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/vip.dart';
import 'package:flutter_app/screens/sign_in/sign_in_screen.dart';
import 'package:flutter_app/services/auth.dart';
import 'package:provider/provider.dart';

import '../Pages/Seller.dart';
import '../Pages/about.dart';
import '../Pages/category.dart';
import '../Pages/profile.dart';
import '../Pages/settings.dart';
import '../Pages/test.dart';
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
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    //UserData customer = context.watch<UserData>();

    return Drawer(
      child: new ListView(
        children: <Widget>[
          //            header
          // UserAccountsDrawerHeader(
//             accountName: Text(UserData().name),
//             accountEmail: Text(UserData().email),
//             currentAccountPicture: GestureDetector(
//               onTap: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => Profile()));
//               },
//               child: new CircleAvatar(
//                   //backgroundImage: AssetImage('images/${customer.photo}'),
//                   /*backgroundColor: Colors.black,
//                 child: Icon(
//                   Icons.person,
//                   color: Colors.white,
//                 ),*/
//                   ),
//             ),
//             decoration: new BoxDecoration(
//               color: Colors.grey,
//             ),
//           ),

// //              Body
//           Divider(
//             thickness: 5,
//             color: Colors.black,
//           ),
//           ListTile(
//             onTap: () {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => SellerInterface()));
//             },
//             title: Text('Test Seller interface'),
//             leading: Icon(Icons.person),
//           ),

//           Divider(
//             height: 20,
//             thickness: 5,
//             color: Colors.black,
//           ),

//           if (UserData().vip == false)
//             ListTile(
//               onTap: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => Vip(user: UserData())));
//               },
//               title: Row(
//                 children: [
//                   Text(
//                     'Update to vip account',
//                     style: TextStyle(
//                       color: Colors.amber,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 5,
//                   ),
//                   Icon(
//                     Icons.star,
//                     color: Colors.amber,
//                   ),
//                 ],
//               ),
//               leading: Icon(
//                 Icons.person,
//                 color: Colors.amber,
//               ),
//             ),
// //////////////////////////////DOWN BELOW LISTTILE CAUSES
// ///////////// ERROR(Failed assertion: boolean expression must not be null)

//           // ListTile(
//           //   onTap: () {
//           //     Navigator.push(
//           //         context, MaterialPageRoute(builder: (context) => Profile())
//           //         );
//           //   },
//           //   title: customer.vip
//           //       ? Text(
//           //           'My Account',
//           //           style: TextStyle(
//           //             color: Colors.amberAccent,
//           //           ),
//           //         )
//           //       : Text('My Account'),
//           //   leading: customer.vip
//           //       ? Icon(
//           //           Icons.person,
//           //           color: Colors.amberAccent,
//           //         )
//           //       : Icon(Icons.person),
//           // ),

//           ListTile(
//             onTap: () {
//               Navigator.push(
//                   context, MaterialPageRoute(builder: (context) => Screen2()));
//             },
//             title: Text('My Orders'),
//             leading: Icon(Icons.shopping_basket),
//           ),

//           ListTile(
//             onTap: () {
//               Navigator.push(
//                   context, MaterialPageRoute(builder: (context) => Screen2()));
//             },
//             title: Text('Favourite'),
//             leading: Icon(Icons.favorite),
//           ),

//           Divider(),

//           new Padding(
//             padding: const EdgeInsets.all(4.0),
//             // title for the categoties part
//             child: new Text('Categories'),
//           ),
//           ListTile(
//             onTap: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => CategoryView(
//                             category: 'Shirt',
//                           )));
//             },
//             title: Text('Shirt'),
//             leading: Icon(Icons.dashboard),
//           ),
//           ListTile(
//             onTap: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => CategoryView(
//                             category: 'accessories',
//                           )));
//             },
//             title: Text('Accessories'),
//             leading: Icon(Icons.dashboard),
//           ),
//           ListTile(
//             onTap: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => CategoryView(
//                             category: 'dress',
//                           )));
//             },
//             title: Text('Dress'),
//             leading: Icon(Icons.dashboard),
//           ),
//           ListTile(
//             onTap: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => CategoryView(
//                             category: 'formal',
//                           )));
//             },
//             title: Text('Formal'),
//             leading: Icon(Icons.dashboard),
//           ),
//           ListTile(
//             onTap: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => CategoryView(
//                             category: 'informal',
//                           )));
//             },
//             title: Text('Informal'),
//             leading: Icon(Icons.dashboard),
//           ),
//           ListTile(
//             onTap: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => CategoryView(
//                             category: 'jeans',
//                           )));
//             },
//             title: Text('Jeans'),
//             leading: Icon(Icons.dashboard),
//           ),
//           ListTile(
//             onTap: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => CategoryView(
//                             category: 'shoes',
//                           )));
//             },
//             title: Text('Shoes'),
//             leading: Icon(Icons.dashboard),
//           ),

//           Divider(),

//           ListTile(
//             onTap: () {
//               Navigator.push(
//                   context, MaterialPageRoute(builder: (context) => Settings()));
//             },
//             title: Text('Settings'),
//             leading: Icon(
//               Icons.settings,
//               color: Colors.red,
//             ),
//           ),

//           ListTile(
//             onTap: () {
//               Navigator.push(
//                   context, MaterialPageRoute(builder: (context) => About()));
//             },
//             title: Text('About'),
//             leading: Icon(
//               Icons.help,
//               color: Colors.red,
//             ),
//           ),
          ListTile(
            onTap: () async {
              await _auth.signOut();
              Navigator.popAndPushNamed(
                context,
                SignInScreen.routeName,
              );
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
