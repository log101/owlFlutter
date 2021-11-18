import 'dart:async';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/services.dart' show rootBundle;

class ChatbotRepository {
  ChatbotRepository(this.dialogflowInstance);
  final DialogFlowtter dialogflowInstance;

  Future<String?> chatbotResponse(String message) {
    return dialogflowInstance
        .detectIntent(
            queryInput:
                QueryInput(text: TextInput(text: message, languageCode: 'en')))
        .then((value) => value.text);
  }
}
