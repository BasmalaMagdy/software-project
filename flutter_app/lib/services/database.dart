import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/services/storage.dart';

import '../models/category.dart';
import '../models/comment.dart';
import '../models/product.dart';
import '../models/user.dart';
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

  Future<void> updateUserData(
      {String id,
      String name,
      String phone,
      String email,
      UserData customer}) async {
    return await userCollection.doc(id).update({
      'name': name,
      'phone': phone,
      'email': email,
    });
  }

  Future<void> upgradeUserToVip({bool vip, UserData customer}) async {
    return await userCollection.doc(customer.uid).update({
      'name': customer.name,
      'phone': customer.phone,
      'photo': customer.photo,
      'email': customer.email,

      'type': customer.type,
      'vip': vip,
      //'points': customer.points,
    });
  }

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
      vip: snapshot.data()['vip'] ?? false,
    );
  }

  Future<void> createUserData(
      {String id,
      String name,
      String phone,
      String email,
      String type,
      String password,
      UserData customer,
      bool guest,
      File imageFile}) async {
    return await userCollection.doc(id).set({
      'name': name ?? "",
      'phone': phone ?? "",
      'email': email ?? "",
      'type': type ?? "",
      'password': password ?? "",
      'guest': guest ?? false,
    }).then((value) {
      // if (imageFile != null)
      //   FireStorageService.changeUserImage(image: imageFile, user: customer);
    });
  }

  Stream<UserData> get Users {
    if (userCollection.doc(uid) != null)
      return userCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
    else
      return null;
  }

  /**                                       USER SEARCH HISTORY DATABASE PART                                     **/
  Future<void> addToUserHistory({String uid, ProductData product}) async {
    return await userCollection
        .doc(uid)
        .collection("searchHistory")
        .doc(product.pid)
        .set({
      'pid': product.pid,
      'name': product.name,
      'category': product.category,
      'description': product.description,
      'sid': product.sid,
      'price': product.price,
      'quantity': product.quantity,
      'photo': product.photo,
      'size': product.size,
      'color': product.color,
      //'product': product
    });
  }

  Future<void> DeleteHistoryData({String uid}) {
    userCollection.doc(uid).collection('searchHistory').get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs) {
        ds.reference.delete();
      }
    }).catchError((error) {
      print("Error removing document: $error");
    });
  }

  List<SearchProductData> _userHistoryFromSnapshot(QuerySnapshot snapshots) {
    return snapshots.docs.map((snapshot) {
      return SearchProductData(
        pid: snapshot.id,
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
    //return CommentData(cid: snapshot.id);
  }

  Stream<List<SearchProductData>> history({String uid}) {
    if (userCollection.doc(uid).collection("searchHistory") != null) {
      return userCollection
          .doc(uid)
          .collection("searchHistory")
          .snapshots()
          .map(_userHistoryFromSnapshot);
    } else
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
