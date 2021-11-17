import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  Todo(
      {required this.timestamp,
      required this.title,
      this.id = "",
      this.howto = "",
      this.imageurl = "",
      this.info = "",
      this.done = false,
      this.category = ""});
  final Timestamp timestamp;
  final String category;
  final String title;
  final String howto;
  final String imageurl;
  final String info;
  final bool done;
  final String id;

  static Todo fromDocument(DocumentSnapshot doc) {
    return Todo(
      id: doc.id,
      timestamp: doc.get("timestamp"),
      title: doc.get("title"),
      howto: doc.get("howto"),
      imageurl: doc.get("imageurl"),
      info: doc.get("info"),
      done: doc.get("done"),
      category: doc.get("category"),
    );
  }

  static Map<String, dynamic> toMap(Todo todo) {
    return {
      'title': todo.title,
      'timestamp': todo.timestamp,
      'howto': todo.howto,
      'imageurl': todo.imageurl,
      'info': todo.info,
      'done': todo.done,
      'category': todo.category,
    };
  }
}
