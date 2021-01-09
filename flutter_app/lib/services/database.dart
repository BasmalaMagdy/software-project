import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import '../models/product.dart';
import '../models/comment.dart';
import '../models/category.dart';

class DatabaseService {
  final String uid;
  String get UID {
    return uid;
  }

  DatabaseService({this.uid});

  // collection reference
  final CollectionReference productsCollection =
      FirebaseFirestore.instance.collection('products');
  final CollectionReference categoryCollection =
      FirebaseFirestore.instance.collection('categories');

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

  Future<void> CreateProductData(
      {String name,
      String category,
      String description,
      String photo,
      String sid,
      int price,
      int quantity,
      String color,
      String size}) async {
    return await productsCollection.add({
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
