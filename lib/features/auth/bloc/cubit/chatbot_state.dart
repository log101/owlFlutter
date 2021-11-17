part of 'chatbot_cubit.dart';

abstract class ChatbotState extends Equatable {
  const ChatbotState();

  final String _projectId = "owl-app-e2025";

  String get projectId => _projectId;

  @override
  List<Object> get props => [_projectId];
}

class ChatbotInitial extends ChatbotState {}

class ChatbotInitializing extends ChatbotState {}

class ChatbotReady extends ChatbotState {
  const ChatbotReady(this._sessionId, this._conversation);
  final String _sessionId;
  final List<Message> _conversation;

  String get sessionId => _sessionId;
  List<Message> get conversation => _conversation;

  @override
  List<Object> get props => [_sessionId, _conversation];
}

class ChatbotDown extends ChatbotState {}

class ChatbotThinking extends ChatbotState {}
