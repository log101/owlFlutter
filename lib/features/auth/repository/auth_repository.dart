import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthRepository {
  AuthRepository(this._firebaseInstance);

  final FirebaseAuth _firebaseInstance;

  Future<void> logIn(String username, String password) async {
    try {
      UserCredential userCredential = await _firebaseInstance
          .signInWithEmailAndPassword(email: username, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
