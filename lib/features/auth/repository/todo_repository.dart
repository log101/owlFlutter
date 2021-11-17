import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/model.dart';

class TodoRepository {
  TodoRepository(this._firebaseInstance);

  final FirebaseFirestore _firebaseInstance;

  late final CollectionReference _todosCollection =
      _firebaseInstance.collection("recipes");

  Future<List<Todo>> getTodos(DateTime date) async {
    print(Timestamp.fromDate(date));
    final questionDocs = await _todosCollection
        .where("timestamp",
            isGreaterThan:
                Timestamp.fromDate(DateTime(date.year, date.month, date.day)),
            isLessThan: Timestamp.fromDate(
                DateTime(date.year, date.month, date.day)
                    .add(const Duration(days: 1))))
        .get();
    return questionDocs.docs.map((doc) => Todo.fromDocument(doc)).toList();
  }

  Future<void> addTodo(Todo todo) async {
    _todosCollection.add(Todo.toMap(todo)).catchError((error) => print(error));
  }
}
