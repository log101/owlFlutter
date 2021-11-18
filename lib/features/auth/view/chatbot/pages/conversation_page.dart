import 'package:auth/features/auth/bloc/bloc.dart';
import 'package:auth/features/auth/view/chatbot/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConversationPage extends StatelessWidget {
  const ConversationPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatbotCubit, ChatbotState>(
      builder: (context, state) {
        return Column(
          children: [
            for (var message in state.conversation) MessageTile(message),
            ElevatedButton(
                onPressed: () => context.read<ChatbotCubit>().sendMessage("hi"),
                child: Text("send")),
          ],
        );
      },
    );
  }
}
