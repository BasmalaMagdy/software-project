// this is the card for each choosen item by the user
// this is linked to cart.dart
// add comments
import 'package:flutter/material.dart';
import '../bloc/cart_items_bloc.dart';
import '../services/storage.dart';

//check if the cart is empty or not
class ShopItemsWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: bloc.allItems,
      stream: bloc.getStream,
      builder: (context, snapshot) {
        return snapshot.data["fav items"].length > 0
            ? shopItemsListBuilder(snapshot)
            : Center(child: Text("You haven't added any item yet"));
      },
    );
  }

  Widget shopItemsListBuilder(snapshot) {
    return ListView.builder(
        itemCount: snapshot.data["fav items"].length,
        itemBuilder: (BuildContext context, i) {
          final favList = snapshot.data["fav items"];
          return FutureBuilder(
            future: getImage(
                context, 'Products/${favList[i].name}/${favList[i].photo}'),
            builder: (context, snapshott) {
              return Card(
                child: ListTile(
                  leading: snapshott.data,
                  /*new Image.asset(
                    'images/cats/${favList[i].photo}', //================================photo====================================================
                    width: 80.0,
                    height: 80.0,
                  ),*/
                  title: new Text(favList[i]
                      .name), //==========================================name====================================================
                  subtitle: new Column(
                    children: <Widget>[
                      new Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: new Text("Size:"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: new Text(
                              favList[i]
                                  .size, //================================================size=====================================================
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                          new Padding(
                            padding:
                                const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                            child: new Text("Color:"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: new Text(
                              favList[i]
                                  .color, //========================================================color=============================================
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                      new Container(
                        alignment: Alignment.topLeft,
                        child: new Text(
                          "\$${favList[i].price.toString()}", //======================================================price====================================================
                          style: TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }
}
// class item_card extends StatefulWidget {
//   @override
//   _item_cardState createState() => _item_cardState();
// }
//
// class _item_cardState extends State<item_card> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: ListTile(
//         leading: new Image.asset('images/cats/${widget.item['photo']}',
//           width: 80.0,
//           height: 80.0,
//         ),
//         title: new Text('${widget.item['name']}'), //==========================================name====================================================
//         subtitle: new Column(
//           children: <Widget>[
//             new Row(
//               children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.all(0.0),
//                   child: new Text("Size:"),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(4.0),
//                   child: new Text(
//                     '${widget.item['size']}', //================================================size=====================================================
//                     style: TextStyle(color: Colors.red),
//                   ),
//                 ),
//                 new Padding(
//                   padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
//                   child: new Text("Color:"),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(4.0),
//                   child: new Text(
//                     '${widget.item['color']}', //========================================================color=============================================
//                     style: TextStyle(color: Colors.red),
//                   ),
//                 ),
//               ],
//             ),
//             new Container(
//               alignment: Alignment.topLeft,
//               child: new Text(
//                 "\$${widget.item['price']}",
//                 style: TextStyle(
//                     fontSize: 17.0,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.red),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
