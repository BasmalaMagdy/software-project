import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/common/size_config.dart';
import 'package:flutter_app/models/product.dart';

import 'dataform.dart';

class EditProduct extends StatefulWidget {
  static String routeName = "/EditProduct";
  EditProduct({Key key, this.product, this.user}) : super(key: key);
  final ProductData product;
  final user;
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
            user: widget.user,
            product: widget.product,
          ),
        ),
      ]),
    );
  }
}
