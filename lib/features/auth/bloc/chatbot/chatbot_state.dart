part of 'chatbot_cubit.dart';

abstract class ChatbotState extends Equatable {
  const ChatbotState(this.conversation);

  final List<Message> conversation;

  @override
  List<Object> get props => [conversation];
}

class ChatbotInitial extends ChatbotState {
  ChatbotInitial(List<Message> conversation) : super(conversation);
}

class ChatbotInitializing extends ChatbotState {
  ChatbotInitializing(List<Message> conversation) : super(conversation);
}

class ChatbotReady extends ChatbotState {
  ChatbotReady(List<Message> conversation) : super(conversation);
}

class ChatbotDown extends ChatbotState {
  ChatbotDown(List<Message> conversation) : super(conversation);
}

class ChatbotThinking extends ChatbotState {
  ChatbotThinking(List<Message> conversation) : super(conversation);
}

class ChatbotMakingAppointment extends ChatbotState {
  ChatbotMakingAppointment(List<Message> conversation) : super(conversation);
}
