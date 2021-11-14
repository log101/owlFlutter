import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  Todo(this.title, this.text);

  final String title;
  final String text;

  static Todo fromDocument(DocumentSnapshot doc) {
    return Todo(doc.get("title"), doc.get("text"));
  }
}
