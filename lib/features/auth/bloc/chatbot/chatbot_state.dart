part of 'chatbot_bloc.dart';

abstract class ChatbotState extends Equatable {
  const ChatbotState();
  
  @override
  List<Object> get props => [];
}

class ChatbotInitial extends ChatbotState {}
