import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_app/services/storage.dart';

import '../models/product.dart';
import '../models/comment.dart';
import '../models/category.dart';
import '../models/user.dart';

import 'dart:io';

import '../services/storage.dart';

class DatabaseService {
  final String uid;

  String get UID {
    return uid;
  }

  String currentid;

  DatabaseService({this.uid});

  // collection reference
  final CollectionReference productsCollection =
      FirebaseFirestore.instance.collection('products');
  final CollectionReference categoryCollection =
      FirebaseFirestore.instance.collection('categories');
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

/**                                       User DATABASE PART                                                **/

  /* Future<void> updateUserData(
      String name, String photo, String phone, String email) async {
    return await usersCollection.doc(uid).set({
      'name': name,
      'phone': phone,
      'photo': photo,
      'email': email,
    });
  }

  // user data from snapshots
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        name: snapshot.data()['name'] ?? '',
        phone: snapshot.data()['phone'] ?? '',
        photo: snapshot.data()['photo'] ?? '',
        email: snapshot.data()['email'] ?? '');
  }*/

  // category data from snapshots
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: snapshot.id,
      email: snapshot.data()['email'] ?? '',
      name: snapshot.data()['name'] ?? '',
      phone: snapshot.data()['phone'] ?? '',
      photo: snapshot.data()['photo'] ?? '',
      points: snapshot.data()['points'] ?? 0,
      type: snapshot.data()['type'] ?? '',
    );
  }

  Stream<UserData> get Users {
    if (userCollection.doc(uid) != null)
      return userCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
    else
      return null;
  }

/**                                       CATEGORY DATABASE PART                                                **/

  // category data from snapshots
  List<CategoryData> _categoryDataFromSnapshot(QuerySnapshot snapshots) {
    return snapshots.docs.map((snapshot) {
      return CategoryData(
        catid: snapshot.id,
        caption: snapshot.data()['caption'] ?? '',
        category: snapshot.data()['category'] ?? '',
        pic: snapshot.data()['pic'] ?? '',
      );
    }).toList();
  }

  Stream<List<CategoryData>> get Categories {
    if (categoryCollection != null)
      return categoryCollection.snapshots().map(_categoryDataFromSnapshot);
    else
      return null;
  }

/**                                       PRODUCT DATABASE PART                                                **/
  Future<void> updateProductData(
      {String pid,
      String name,
      String category,
      String description,
      String photo,
      String sid,
      int price,
      int quantity,
      String size,
      String color}) async {
    return await productsCollection.doc(pid).set({
      'name': name,
      'category': category,
      'description': description,
      'sid': sid,
      'price': price,
      'quantity': quantity,
      'photo': photo,
      'size': size,
      'color': color
    });
  }

  Future<String> CreateProductData(
      {String name,
      String category,
      String description,
      String photo,
      String sid,
      int price,
      int quantity,
      String color,
      String size,
      List<File> pimglist,
      final List<String> imgnames}) async {
    await productsCollection.add({
      'name': name,
      'category': category,
      'description': description,
      'sid': sid,
      'price': price,
      'quantity': quantity,
      'photo': photo,
      'size': size,
      'color': color
    }).then((value) async {
      currentid = value.id;
      print("****************Data base current id*****************");
      print(currentid);
      for (int i = 0; i < pimglist.length; i++) {
        await FireStorageService.uploadImage(
            pimglist[i], currentid, imgnames[i]);
      }
      return value.id;
    });
  }

  Future<void> DeleteProductData({ProductData product}) {
    productsCollection.doc(product.pid).delete().then((value) {
      FireStorageService.removeImage(product.pid);
      print("Document successfully deleted!");
    }).catchError((error) {
      print("Error removing document: $error");
    });
  }

  // product data from snapshots
  List<ProductData> _productDataFromSnapshot(QuerySnapshot snapshots) {
    return snapshots.docs.map((snapshot) {
      return ProductData(
        pid: snapshot.id ?? '',
        name: snapshot.data()['name'] ?? '',
        category: snapshot.data()['category'] ?? '',
        description: snapshot.data()['description'] ?? '',
        photo: snapshot.data()['photo'] ?? '',
        sid: snapshot.data()['sid'] ?? '',
        price: snapshot.data()['price'] ?? 0,
        quantity: snapshot.data()['quantity'] ?? 0,
        color: snapshot.data()['color'] ?? '',
        size: snapshot.data()['size'] ?? '',
      );
    }).toList();
  }

  Stream<List<ProductData>> get Products {
    if (productsCollection != null)
      return productsCollection.snapshots().map(_productDataFromSnapshot);
    else
      return null;
  }

/**                                       COMMENT DATABASE PART                                                **/

  Future<void> CreateProductComment(
      {String pid, String uid, String comment}) async {
    return await productsCollection.doc(pid).collection("comments").add({
      'product': pid,
      'user': uid,
      'comment': comment,
    });
  }

  List<CommentData> _userCommentFromSnapshot(QuerySnapshot snapshots) {
    return snapshots.docs.map((snapshot) {
      return CommentData(
        cid: snapshot.id,
        pid: snapshot.data()['pid'] ?? '',
        uid: snapshot.data()['uid'] ?? '',
        comment: snapshot.data()['comment'] ?? '',
      );
    }).toList();
    //return CommentData(cid: snapshot.id);
  }

  Stream<List<CommentData>> comments({String pid}) {
    if (productsCollection.doc(pid).collection("comments") != null) {
      return productsCollection
          .doc(pid)
          .collection("comments")
          .snapshots()
          .map(_userCommentFromSnapshot);
    } else
      return null;
  }
}
