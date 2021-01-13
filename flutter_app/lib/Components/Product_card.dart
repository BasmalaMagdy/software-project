import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/editproduct/editproduct.dart';
import 'package:flutter_app/common/size_config.dart';
import 'package:flutter_app/services/database.dart';
import 'package:provider/provider.dart';

import '../Pages/productview/product_view.dart';
import '../common/commonwidget.dart';
import '../models/product.dart';
import '../models/user.dart';
import '../services/storage.dart';

class CardProduct extends StatefulWidget {
  CardProduct({Key key, this.product, this.customer}) : super(key: key);
  final ProductData product;
  final UserData customer;

  @override
  _CardProductState createState() => _CardProductState();
}

class _CardProductState extends State<CardProduct> {
  @override
  Widget build(BuildContext context) {
    //UserData customer = context.watch<UserData>();
    var hieght = SizeConfig.screenHeight * 0.16;
    var rad = SizeConfig.screenHeight * 0.02;
    return FutureBuilder(
        future: getImage(
            context, 'Products/${widget.product.pid}/${widget.product.photo}'),
        builder: (context, snapshot) {
          return Container(
            height: hieght,
            margin: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Product(
                                  product: widget.product,
                                  snapshot: snapshot,
                                  user: widget.customer,
                                )));
                  },
                  child: Row(
                    children: [
                      Container(
                        height: hieght,
                        width: SizeConfig.screenWidth * 0.3,
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
                        child:
                            snapshot.data != null ? snapshot.data : Loading(),
                      ),
                      Container(
                        height: hieght,
                        width: SizeConfig.screenWidth * 0.47,
                        padding: EdgeInsets.all(5),
                        /* margin:
                      EdgeInsets.only(top: SizeConfig.screenHeight * 0.002),*/
                        decoration: BoxDecoration(
                            color: Colors.white, boxShadow: ShadowList),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.product.name,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: SizeConfig.screenWidth * 0.04,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              child: Text(
                                //'''discription for this project which is very very very very very very useful''',
                                '''${widget.product.description}''',
                                style: TextStyle(
                                  fontSize: SizeConfig.screenWidth * 0.032,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                'Price :\$${widget.product.price.toString()}',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: SizeConfig.screenWidth * 0.03),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: ShadowList,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(rad),
                            bottomRight: Radius.circular(rad))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        if (widget.customer.type == 'buyer' &&
                            widget.customer.guest == false)
                          IconButton(
                            icon: Icon(Icons.favorite_border),
                            onPressed: () {
                              DatabaseService().CreateWishlist(
                                  product: widget.product,
                                  uid: widget.customer.uid);
                            },
                          ),
                        if (widget.customer.type == 'buyer' &&
                            widget.customer.guest == false)
                          IconButton(
                            icon: Icon(Icons.add_shopping_cart),
                            onPressed: () {
                              // TO DO : if in the cart change the cart icon
                              DatabaseService().CreateUserCart(
                                color: widget.product.color,
                                name: widget.product.name,
                                photo: widget.product.photo,
                                pid: widget.product.pid,
                                pquantity: 1,
                                price: widget.product.price,
                                sid: widget.product.sid,
                                size: widget.product.size,
                                uid: widget.customer.uid,
                              );
                            },
                          ),
                        if (widget.customer.type == 'seller')
                          IconButton(
                            icon: Icon(
                              Icons.remove,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              // TO DO : if in the cart change the cart icon
                              setState(() {
                                DatabaseService()
                                    .DeleteProductData(product: widget.product);
                              });
                            },
                          ),
                        if (widget.customer.type == 'seller')
                          IconButton(
                            icon: Icon(
                              Icons.edit,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              // TO DO : if in the cart change the cart icon
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditProduct(
                                            product: widget.product,
                                          )));
                            },
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            //child: Products(),
          );
        });
  }
}
