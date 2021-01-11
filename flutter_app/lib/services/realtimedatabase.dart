import 'package:firebase_database/firebase_database.dart';

import '../models/product.dart';

final databaseref = FirebaseDatabase.instance.reference();

DatabaseReference addProductToHistroy({ProductData product, String uid}) {
  var id = databaseref.child('History/').push();

  id.set(product.tojason());
  return id;
}

// https://www.youtube.com/watch?v=qWjnxjB-sTA
/*
Future<void> addProductToHistroy({ProductData product, String uid}) async {
  return await historyref.push().child(uid).set(product);
}
*/
/* return await userCollection.doc(id).update({
      'name': name,
      'phone': phone,
      'email': email,
    }).then((value) {
      FireStorageService.changeUserImage(image: imageFile, user: customer);
    });
  }
  //final ref = referenceDatabase.reference();

  // final ref = referenceDatabase.reference();
}
*/
