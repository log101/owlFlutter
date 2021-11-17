import 'package:auth/features/auth/model/chatbot/message.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:googleapis/dialogflow/v3.dart';
import 'package:http/http.dart' as http;

part 'chatbot_state.dart';

class ChatbotCubit extends Cubit<ChatbotState> {
  ChatbotCubit() : super(ChatbotInitial());

  void initializeChatbot() {
    http.Client client = http.Client();
    DialogflowApi(client);
  }
}
