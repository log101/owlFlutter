import 'package:auth/features/auth/model/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageTile extends StatelessWidget {
  const MessageTile(this.message);

  final Message message;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(message.sender.toString() + " : " + message.text),
    );
  }
}
