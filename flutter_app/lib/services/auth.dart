import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/services/database.dart';

class AuthService {
  final FirebaseAuth _auth;
  AuthService(this._auth);
  // creates user obj based on FirebaseUser (User)
  Stream<User> get authStateChanges => _auth.idTokenChanges();

  /*UserData _userFromFireBase(User user) {
    return user != null
        ? UserData(uid: user.uid, guest: user.isAnonymous)
        : null;
  }*/

  // auth change user stream
  /*Stream<UserData> get user {
    return _auth.authStateChanges().map(_userFromFireBase);
  }*/

  // sign in as GUEST
  Future guestUser() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      print('888888888888888888888888888888888888888888888888');
      print(result.user.isAnonymous);
      User user = result.user;
      DatabaseService().createUserData(
        id: user.uid,
        guest: true,
        type: 'buyer',
      );
      //return user;
      //_userFromFireBase(user);
    } on FirebaseAuthException catch (error) {
      print(error.toString());
      return error.code;
    }
  }

  // sign in with email & pass
  Future signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      /*UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password).catchError(onError);

      User user = result.user;
      return user;*/ //_userFromFireBase(user);
    } on FirebaseAuthException catch (error) {
      print(error.toString());
      return error.code;
    }
  }

  // sign up
  Future signUp(String name, String email, String password, String phone,
      String brand, String type) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;

      DatabaseService().createUserData(
          email: email,
          name: name,
          phone: phone,
          type: type,
          id: user.uid,
          password: password);

      try {
        await user.sendEmailVerification();
        //return user.uid;
      } on FirebaseAuthException catch (e) {
        print("An error occured while trying to send email verification");
        print(e.message);
      }

      // UserData().name = name;
      // UserData().email = email;
      // UserData().phone = phone;
      // UserData().brand = brand;
      // UserData().type = type;
      //return user; // _userFromFireBase(user);
    } on FirebaseAuthException catch (error) {
      print(error.toString());
      return error.code;
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } on FirebaseAuthException catch (error) {
      print(error.toString());
      return error.code;
    }
  }
}
