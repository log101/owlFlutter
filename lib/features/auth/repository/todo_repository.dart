import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/model.dart';

class TodoRepository {
  TodoRepository(this._firebaseInstance);

  final FirebaseFirestore _firebaseInstance;

  Future<List<Todo>> getTodos(DateTime date) async {
    print(Timestamp.fromDate(date));
    final questionDocs = await _firebaseInstance
        .collection("recipes")
        .where("timestamp",
            isGreaterThan:
                Timestamp.fromDate(DateTime(date.year, date.month, date.day)),
            isLessThan: Timestamp.fromDate(
                DateTime(date.year, date.month, date.day)
                    .add(const Duration(days: 1))))
        .get();
    return questionDocs.docs.map((doc) => Todo.fromDocument(doc)).toList();
  }
}
