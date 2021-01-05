import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/models/product.dart';
import 'package:flutter_app/models/comment.dart';

class DatabaseService {
  final String uid;
  String get UID{
    return uid;
  }
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference productsCollection = FirebaseFirestore.instance.collection('products');

  Future<void> updateProductData(String pid, String name, String category,
      String description, String photo, String sid, double price,
      double quantity) async {
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

  Future<void> CreateProductData(String name, String category,
      String description, String photo, String sid, double price,
      double quantity) async {
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

  Future<void> CreateProductComment(String cid, String pid, String uid) async {
    return await productsCollection.doc(pid).collection("comments").add({
      'comment': cid,
      'product': pid,
      'user': uid,
    });
  }


  // product data from snapshots
  List<ProductData> _userDataFromSnapshot(QuerySnapshot  doc) {
    return doc.docs.map((snapshot){
      return ProductData(
        pid: snapshot.id,
        name: snapshot.data()['name'],
        category: snapshot.data()['category'],
        description: snapshot.data()['description'],
        photo: snapshot.data()['photo'],
        sid: snapshot.data()['sid'],
        price: snapshot.data()['price'],
        quantity: snapshot.data()['quantity'],
      );
    }).toList();
  }

  CommentData _userCommentFromSnapshot(DocumentSnapshot snapshot) {
    return CommentData(
        cid: snapshot.id);
  }

  Stream<List<ProductData>> get Products {
    return productsCollection.snapshots().map(_userDataFromSnapshot);
  }

  Future<List<CommentData>> comments({String pid}) async{
    return await productsCollection.doc(pid).collection("comments").doc()
        .snapshots()
        .map((snapshot) {
      return _userCommentFromSnapshot(snapshot);
    }
    ).toList();
  }
}





