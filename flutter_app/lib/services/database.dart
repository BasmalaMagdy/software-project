import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/models/product.dart';
import 'package:flutter_app/models/comment.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference productsCollection =
      FirebaseFirestore.instance.collection('products');   
  final CollectionReference commentsCollection =
      FirebaseFirestore.instance.collection('comments');
  Future<void> updateProductData(
      String pid, String name, String category,String description, String photo,String sid, double price, double quantity) async {
    return await productsCollection.doc(pid).set({
      'name': name,
      'category': category,
      'description': description,
      'sid': sid,
      'price': price,
      'quantity': quantity,
      'photo': photo,
    });
  }

  Future<void> CreateProductData(
       String name, String category,String description, String photo,String sid, double price, double quantity) async {
    return await productsCollection.add({
      'name': name,
      'category': category,
      'description': description,
      'sid': sid,
      'price': price,
      'quantity': quantity,
      'photo': photo,
    });
  }
      Future<void> CreateProductComment(
      String cid, String pid, String uid) async {
    return await productsCollection.doc(pid).collection("comments").add({
      'comment': cid,
      'product': pid,
      'user': uid,
    });
  }

  // Product data from snapshots
  ProductData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return ProductData(
        pid: snapshot.id);
  }

    CommentData _userCommentFromSnapshot(DocumentSnapshot snapshot) {
    return CommentData(
        cid: snapshot.id);
  }

    Future<List<CommentData>> comments(pid) {
    return productsCollection.doc(pid).collection("comments").doc().snapshots().map((snapshot) {
     return  _userCommentFromSnapshot(snapshot);
    }
    ).toList();
  }


}





