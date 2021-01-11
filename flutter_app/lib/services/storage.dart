import 'package:flutter_app/common/size_config.dart';

import '../models/product.dart';
import 'package:flutter/material.dart';
import '../Pages/productview/product_view.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:io';

class FireStorageService extends ChangeNotifier {
  FireStorageService();
  static Future<dynamic> loadImage(String image) async {
    return await FirebaseStorage.instance.ref().child(image).getDownloadURL();
  }

  static Future<dynamic> uploadImage(
      File image, String product, String name) async {
    return await FirebaseStorage.instance
        .ref()
        .child('Products/$product/$name')
        .putFile(image);
  }

  static Future<dynamic> removeImage(String product) async {
    return await FirebaseStorage.instance
        .ref()
        .child('Products/$product/')
        .delete();
  }
}

Future<Widget> getImage(BuildContext context, String image) async {
  Image m;
  print(image);
  print(FireStorageService.loadImage(image));
  if (FireStorageService.loadImage(image) != null) {
    await FireStorageService.loadImage(image).then((downloadUrl) {
      m = Image.network(
        downloadUrl.toString(),
        fit: BoxFit.scaleDown,
        height: SizeConfig.screenHeight * 0.14,
      );
    });
    return m;
  } else
    return Container();
}

class Loading extends StatelessWidget {
  const Loading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: SpinKitChasingDots(
          color: Colors.blue,
          size: 20,
        ),
      ),
    );
  }
}
