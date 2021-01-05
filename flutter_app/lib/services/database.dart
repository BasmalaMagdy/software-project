import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/models/product.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference productsCollection =
      FirebaseFirestore.instance.collection('products');

  Future<void> updateProductData (
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
  Future<void> CreateProductData (
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

  // product data from snapshots
  ProductData _userDataFromSnapshot(DocumentSnapshot snapshot) {
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
  }

  Future<List<ProductData>> get Products{
    return productsCollection.doc().snapshots().map((snapshot){
      return _userDataFromSnapshot(snapshot);
    }).toList();
  }


}
