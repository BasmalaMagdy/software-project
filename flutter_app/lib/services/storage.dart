import 'package:flutter_app/common/size_config.dart';

import '../models/product.dart';
import 'package:flutter/material.dart';
import '../Pages/productview/product_view.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class FireStorageService extends ChangeNotifier {
  FireStorageService();
  static Future<dynamic> loadImage(BuildContext context, String image) async {
    return await FirebaseStorage.instance.ref().child(image).getDownloadURL();
  }

  static Future<dynamic> uploadImage(
      BuildContext context, File image, String product, String name) async {
    return await FirebaseStorage.instance
        .ref()
        .child('Products/$product/$name')
        .putFile(image);
  }
}

Future<Widget> getImage(BuildContext context, String image) async {
  Image m;
  await FireStorageService.loadImage(context, image).then((downloadUrl) {
    m = Image.network(
      downloadUrl.toString(),
      fit: BoxFit.scaleDown,
      height: SizeConfig.screenHeight * 0.14,
    );
  });
  return m;
}
