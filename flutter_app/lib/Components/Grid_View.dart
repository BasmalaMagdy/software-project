import 'package:flutter/material.dart';

import 'package:flutter_app/Components/Products.dart';

class Grid_View extends StatefulWidget {
  Grid_View({Key key}) : super(key: key);

  @override
  _Grid_ViewState createState() => _Grid_ViewState();
}

class _Grid_ViewState extends State<Grid_View> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320.0,
      child: Products(),
    );
  }
}
