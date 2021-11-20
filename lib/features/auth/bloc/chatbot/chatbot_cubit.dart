import 'package:auth/features/auth/model/chatbot/message.dart';
import 'package:auth/features/auth/repository/chatbot_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

part 'chatbot_state.dart';

class ChatbotCubit extends Cubit<ChatbotState> {
  ChatbotCubit({required this.chatbotRepository}) : super(ChatbotReady([]));

  final ChatbotRepository chatbotRepository;

  void sendGreetings() {
    sendMessage("hi");
  }

  void sendMessage(String text) async {
    emit(ChatbotThinking(state.conversation));
    final String? response = await chatbotRepository.chatbotResponse(text);

    emit(ChatbotReady(state.conversation
      ..add(Message(Timestamp.now(), Sender.bot, response ?? "(empty)"))));
  }
}
