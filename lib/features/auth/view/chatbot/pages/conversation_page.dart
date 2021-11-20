import 'package:auth/features/auth/bloc/bloc.dart';
import 'package:auth/features/auth/view/chatbot/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConversationPage extends StatefulWidget {
  const ConversationPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ConversationPage> createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  late String _text;

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    /// ChatbotStates
    /// initial, initializing, ready, down, thinking
    return BlocBuilder<ChatbotCubit, ChatbotState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              for (var message in state.conversation) MessageTile(message),
              TextFormField(
                controller: _controller,
                onChanged: (val) => _text = val,
                decoration: const InputDecoration(hintText: 'Title'),
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<ChatbotCubit>().sendMessage(_text);
                    _controller.clear();
                  },
                  child: Text("send")),
            ],
          ),
        );
      },
    );
  }
}
