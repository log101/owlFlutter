import 'package:auth/features/auth/auth.dart';
import 'package:auth/features/auth/bloc/auth/auth_bloc.dart';
import 'package:auth/features/auth/bloc/bloc.dart';
import 'package:auth/features/auth/repository/chatbot_repository.dart';
import 'package:auth/features/auth/repository/todo_repository.dart';
import 'package:auth/features/auth/view/main_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'view.dart';

class InitializingPage extends StatefulWidget {
  const InitializingPage({Key? key}) : super(key: key);

  @override
  _InitializingPageState createState() => _InitializingPageState();
}

class _InitializingPageState extends State<InitializingPage> {
  late DialogFlowtter dialogFlowtter;

  @override
  void initState() {
    super.initState();
    // Create Dialogflow instance
    DialogFlowtter.fromFile(
            path: "assets/owl-app-service.json",
            sessionId: "12345678") // TODO: change sessionID
        .then((instance) => dialogFlowtter = instance);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Owl',
      theme: ThemeData(
        buttonTheme: Theme.of(context).buttonTheme.copyWith(
              highlightColor: Colors.deepPurple,
            ),
        primarySwatch: Colors.deepPurple,
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
        primaryColor: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
        // If else statements should be exhaustive !!!
        if (state is Authenticated) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => TodoBloc(
                    todoRepository: TodoRepository(FirebaseFirestore.instance)),
              ),
              BlocProvider(
                create: (context) => ChatbotCubit(
                    chatbotRepository: ChatbotRepository(dialogFlowtter)),
              ),
            ],
            child: const TodoMainPage(),
          );
        } else if (state is Unauthenticated) {
          return const LoginPage();
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }),
    );
  }
}
