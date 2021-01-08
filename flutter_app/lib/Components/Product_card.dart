import '../common/commonwidget.dart';
import '../services/storage.dart';
import '../models/product.dart';
import 'package:flutter/material.dart';
import '../Pages/productview/product_view.dart';

class CardProduct extends StatefulWidget {
  CardProduct({Key key, this.product}) : super(key: key);
  final ProductData product;

  @override
  _CardProductState createState() => _CardProductState();
}

class _CardProductState extends State<CardProduct> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getImage(
            context, 'Products/${widget.product.name}/${widget.product.photo}'),
        builder: (context, snapshot) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Product(
                          product: widget.product, snapshot: snapshot)));
            },
            child: Container(
              height: 120.0,
              margin: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      //height: 120,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: ShadowList,
                      ),
                      child: snapshot.data,
                      //margin: EdgeInsets.only(left: 10),
                      /*child: Image.asset(
                        'images/cats/${widget.product.photo}',
                        height: 80,
                        width: 80,
                      ),*/
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 90,
                      margin: EdgeInsets.only(top: 8, bottom: 2),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: ShadowList,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, left: 5.0),
                            child: Text(
                              widget.product.name,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              children: [
                                Container(
                                  width: 150,
                                  child: Text(
                                    //'''discription for this project which is very very very very very very useful''',
                                    '''${widget.product.description}''',
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              //child: Products(),
            ),
          );
        });
  }
}
