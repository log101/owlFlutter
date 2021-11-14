import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  Todo(
      {required this.id,
      required this.date,
      required this.title,
      this.howto = "",
      this.imageurl = "",
      this.info = "",
      this.done = false,
      this.category = ""});
  final String date;
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
      date: doc.get("date"),
      title: doc.get("title"),
      howto: doc.get("howto"),
      imageurl: doc.get("imageurl"),
      info: doc.get("info"),
      done: doc.get("done"),
      category: doc.get("category"),
    );
  }
}
