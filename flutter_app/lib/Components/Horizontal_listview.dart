import 'package:flutter/material.dart';
import 'package:flutter_app/common/size_config.dart';
import 'package:flutter_app/models/category.dart';

import '../models/product.dart';
import 'package:provider/provider.dart';
import '../Pages/category.dart';
import '../services/storage.dart';

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
  @override
  Widget build(BuildContext context) {
    List<CategoryData> Categories = context.watch<List<CategoryData>>();

    return Container(
        height: SizeConfig.screenHeight * 0.2,
        child: Categories != null
            ? ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: Categories.length,
                itemBuilder: (BuildContext context, int index) {
                  return FutureBuilder(
                    future: getImage(context, '${Categories[index].pic}'),
                    builder: (context, snapshot) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CategoryView(
                                        category: Categories[index].category,
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
                              if (snapshot.data != null) snapshot.data,
                              if (snapshot.data == null) Loading(),
                              Text(Categories[index].caption,
                                  style: TextStyle(
                                    fontSize: SizeConfig.screenWidth * 0.036,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                })
            : Container());
  }
}
