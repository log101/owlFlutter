import 'package:cloud_firestore/cloud_firestore.dart';

enum Sender { user, bot }

class Message {
  const Message(this.timestamp, this.sender, this.text);

  final String text;
  final Timestamp timestamp;
  final Sender sender;
}
