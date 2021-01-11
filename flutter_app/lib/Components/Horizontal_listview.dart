import 'package:flutter/material.dart';
import 'package:flutter_app/common/size_config.dart';

import '../models/product.dart';
import '../Pages/category.dart';

List<BoxShadow> ShadowList = [
  BoxShadow(color: Colors.grey[300], blurRadius: 30, offset: Offset(0, 10))
];

// ignore: must_be_immutable
class HorizontalList extends StatefulWidget {
  const HorizontalList({Key key}) : super(key: key);
  // ignore: non_constant_identifier_names
  @override
  _HorizontalListState createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  var Categories = [
    {
      "caption": "shirt",
      "pic": 'images/cats/tshirt.png',
      'category': 'shirt',
    },
    {
      "caption": "Accessories",
      "pic": 'images/cats/accessories.png',
      'category': 'accessories',
    },
    {
      "caption": "Dress",
      "pic": 'images/cats/dress.png',
      'category': 'dress',
    },
    {
      "caption": "Formal",
      "pic": 'images/cats/formal.png',
      'category': 'formal',
    },
    {
      "caption": "Informal",
      "pic": 'images/cats/informal.png',
      'category': 'informal',
    },
    {
      "caption": "Jeans",
      "pic": 'images/cats/jeans.png',
      'category': 'jeans',
    },
    {
      "caption": "Shoes",
      "pic": 'images/cats/shoe.png',
      'category': 'shoes',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight * 0.2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: Categories.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CategoryView(
                            category: Categories[index]['category'],
                          )));
            },
            child: Container(
              width: SizeConfig.screenWidth * 0.3,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(left: 5, right: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: ShadowList,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Image.asset(
                    Categories[index]['pic'],
                    height: SizeConfig.screenHeight * 0.13,
                    width: SizeConfig.screenWidth * 0.2,
                    color: Colors.black,
                  ),
                  Text(Categories[index]['caption'],
                      style: TextStyle(
                        fontSize: SizeConfig.screenWidth * 0.036,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
