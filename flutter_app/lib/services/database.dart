import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference productsCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> updateUserData(
      String name, String photo, String phone, String email) async {
    return await productsCollection.doc(uid).set({
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
  }

  // get user document stream
  Stream<DocumentSnapshot> get users {
    return productsCollection.doc(uid).snapshots();
  }
}
