import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/model.dart';

class TodoRepository {
  TodoRepository(this._firebaseInstance);

  final FirebaseFirestore _firebaseInstance;

  Future<List<Todo>> getTodos() async {
    final questionDocs = await _firebaseInstance.collection("recipes").get();
    return questionDocs.docs.map((doc) => Todo.fromDocument(doc)).toList();
  }
}
