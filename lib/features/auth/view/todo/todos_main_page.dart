import 'package:auth/features/auth/bloc/bloc.dart';
import 'package:auth/features/auth/view/chatbot/pages/conversation_page.dart';
import 'package:auth/features/auth/view/todo/pages/add_todos_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'pages/list_todos_page.dart';

class TodoMainPage extends StatefulWidget {
  const TodoMainPage({Key? key}) : super(key: key);

  @override
  _TodoMainPageState createState() => _TodoMainPageState();
}

class _TodoMainPageState extends State<TodoMainPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    void _selectDate() async {
      final DateTime? newDate = await showDatePicker(
        context: context,
        initialDate: context.read<TodoBloc>().state.date,
        firstDate: DateTime(2017, 1),
        lastDate: DateTime(2022, 7),
        helpText: 'Select a date',
      );

      if (newDate != null) {
        context.read<TodoBloc>().add(TodoDateChanged(newDate));
      }
    }

    List<Widget> _tabs = [ListTodosPage(), ConversationPage(), ListTodosPage()];

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: _selectDate, icon: Icon(Icons.calendar_today)),
          IconButton(
              onPressed: () => context.read<AuthBloc>().add(AuthLoggedOut()),
              icon: Icon(Icons.logout)),
        ],
      ),
      body: _tabs.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_answer),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Learn',
          )
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        currentIndex: _selectedIndex,
      ),
    );
  }
}
