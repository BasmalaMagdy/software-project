import 'dart:io';
import 'package:flutter_app/common/size_config.dart';
import 'package:flutter_app/models/product.dart';

import 'dataform.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

class EditProduct extends StatefulWidget {
  static String routeName = "/EditProduct";
  EditProduct({Key key, this.product}) : super(key: key);
  final ProductData product;
  @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  List<File> pimglist = List<File>();
  int imgocunter = 0;
  List<String> imgnames = List<String>();

  @override
  Widget build(BuildContext context) {
    double height = SizeConfig.screenHeight * 0.3;
    double width = SizeConfig.screenWidth * 0.15;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Colors.black),

        centerTitle: true,
        //backgroundColor: const Color(0xFF167F67),
        title: Text(
          'Edit a Product',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: GetDataForm(
            product: widget.product,
          ),
        ),
      ]),
    );
  }

  DoneUpload(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Product Created'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Press ok'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Approve'),
              onPressed: () {
                int count = 0;
                Navigator.of(context).popUntil((_) => count++ >= 2);
                //Navigator.of(context).popUntil((route) => );
              },
            ),
          ],
        );
      },
    );
  }
}
