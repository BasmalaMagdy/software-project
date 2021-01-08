import 'package:flutter_app/common/size_config.dart';

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
    var hieght = SizeConfig.screenHeight * 0.17;
    var rad = SizeConfig.screenHeight * 0.02;
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
              height: hieght,
              margin: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: hieght,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          //topRight: Radius.circular(rad),
                          topLeft: Radius.circular(rad),
                          bottomLeft: Radius.circular(rad),
                        ),
                        boxShadow: ShadowList,
                      ),
                      child: snapshot.data,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: hieght,
                      /* margin:
                          EdgeInsets.only(top: SizeConfig.screenHeight * 0.002),*/
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: ShadowList,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(rad),
                              bottomRight: Radius.circular(rad))),
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
                                fontSize: SizeConfig.screenHeight * 0.027,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              child: Text(
                                //'''discription for this project which is very very very very very very useful''',
                                '''${widget.product.description}''',
                                style: TextStyle(
                                  fontSize: SizeConfig.screenHeight * 0.023,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 5.0, right: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Price :\$${widget.product.price.toString()}',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: SizeConfig.screenWidth * 0.03),
                                ),
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
