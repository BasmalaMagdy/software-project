import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../common/size_config.dart';
import '../models/user.dart';

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

  static Future<dynamic> changeUserImage({UserData user, File image}) async {
    await FirebaseStorage.instance
        .ref()
        .child('Users/${user.uid}/')
        .delete()
        .catchError((error) {
      print(error);
    });
    return await FirebaseStorage.instance
        .ref()
        .child('Users/${user.uid}/${user.photo}')
        .putFile(image)
        .catchError((error) {
      print(error);
    });
  }
}

Future<Image> getImage(BuildContext context, String image) async {
  Image m;
  //print(image);
  //print(FireStorageService.loadImage(image));
  await FireStorageService.loadImage(image).then((downloadUrl) {
    m = Image.network(
      downloadUrl.toString(),
      fit: BoxFit.scaleDown,
      //height: SizeConfig.screenHeight * 0.14,
    );
  });
  return m;
}

Future<Widget> getScaledImage(
    BuildContext context, String image, double scale) async {
  Image m;
  //print(image);
  //print(FireStorageService.loadImage(image));
  await FireStorageService.loadImage(image).then((downloadUrl) {
    m = Image.network(
      downloadUrl.toString(),
      //fit: BoxFit.scaleDown,
      //height: SizeConfig.screenHeight * scale,
    );
  });
  return Container(
    height: SizeConfig.screenHeight * scale,
    child: m,
  );
}

Future<Widget> getProfileImage(BuildContext context, String image) async {
  Widget m;
  //print(image);
  //print(FireStorageService.loadImage(image));
  if (FireStorageService.loadImage(image) != null) {
    await FireStorageService.loadImage(image).then((downloadUrl) {
      m = CircleAvatar(
        backgroundImage: NetworkImage(downloadUrl.toString()),
        backgroundColor: Colors.transparent,
        radius: 90.0,
      );
      /*m = Image.network(
        downloadUrl.toString(),
        fit: BoxFit.scaleDown,
        //height: SizeConfig.screenHeight * 0.14,
      );*/
    });
    return m;
  } else
    return Loading();
}

class Loading extends StatelessWidget {
  const Loading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: SpinKitChasingDots(
          color: Colors.blue,
          size: 35,
        ),
      ),
    );
  }
}
