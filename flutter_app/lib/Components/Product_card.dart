import 'package:flutter/material.dart';

class CardProduct extends StatefulWidget {
  CardProduct({Key key, this.product}) : super(key: key);
  final Map product;

  @override
  _CardProductState createState() => _CardProductState();
}

class _CardProductState extends State<CardProduct> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 240.0,
        child: Row(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blueGrey[300],
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: ShadowList,
                    ),
                    margin: EdgeInsets.only(top: 40, left: 10),
                  ),
                  Align(
                    child: Image.asset(
                      'images/cats/${widget.product['photo']}',
                      color: Colors.white,
                      height: 250,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 70, bottom: 20, right: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: ShadowList,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        widget.product['name'],
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Container(
                            width: 150,
                            child: Text(
                              //'''discription for this project which is very very very very very very useful''',
                              '''${widget.product['discription']}''',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                    // Text('discription',)
                  ],
                ),
              ),
            )
          ],
        ),
        //child: Products(),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
List<BoxShadow> ShadowList = [
  BoxShadow(color: Colors.grey[300], blurRadius: 30, offset: Offset(0, 10))
];
