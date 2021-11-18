import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  AuthRepository(this._firebaseInstance);

  final FirebaseAuth _firebaseInstance;

  Stream<User?> get user {
    return _firebaseInstance.authStateChanges().map((User? user) => user);
  }

  FirebaseAuth get firebaseInstance => _firebaseInstance;

  Future<void> logIn(String username, String password) async {
    try {
      await _firebaseInstance.signInWithEmailAndPassword(
          email: username, password: password);
    } on FirebaseAuthException catch (e) {
      print("Exception occured $e");
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future<void> logOut() {
    return _firebaseInstance.signOut();
  }
}
