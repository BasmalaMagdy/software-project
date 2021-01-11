import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/productview/product_view.dart';
import 'package:flutter_app/models/product.dart';
import 'package:provider/provider.dart';

import '../common/commonwidget.dart';
import '../common/size_config.dart';
import '../models/category.dart';
import '../services/storage.dart';

// ignore: must_be_immutable
class Recommend extends StatefulWidget {
  const Recommend({Key key}) : super(key: key);
  // ignore: non_constant_identifier_names
  @override
  _RecommendState createState() => _RecommendState();
}

class _RecommendState extends State<Recommend> {
  @override
  Widget build(BuildContext context) {
    List<CategoryData> Categories = context.watch<List<CategoryData>>();
    final List<SearchProductData> history =
        context.watch<List<SearchProductData>>();

    return Container(
        height: SizeConfig.screenHeight * 0.22,
        child: history != null
            ? ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: history.length,
                itemBuilder: (BuildContext context, int index) {
                  return FutureBuilder(
                    future: getImage(context,
                        'Products/${history[index].pid}/${history[index].photo}'),
                    builder: (context, snapshot) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Product(
                                      snapshot: snapshot,
                                      product: history[index].change())));
                        },
                        child: Container(
                          height: SizeConfig.screenHeight * 0.2,
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
                              Text(history[index].name,
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
