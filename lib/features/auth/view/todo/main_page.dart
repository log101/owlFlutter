import 'package:auth/features/auth/bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets/widgets.dart';

class TodoMainPage extends StatefulWidget {
  const TodoMainPage({Key? key}) : super(key: key);

  @override
  _TodoMainPageState createState() => _TodoMainPageState();
}

class _TodoMainPageState extends State<TodoMainPage> {
  final int _selectedIndex = 0;

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

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: _selectDate, icon: Icon(Icons.calendar_today)),
          IconButton(
              onPressed: () => context.read<AuthBloc>().add(AuthLoggedOut()),
              icon: Icon(Icons.logout)),
        ],
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          return Center(
            child: Column(children: [
              for (var todo in state.todos) TodoTile(todo),
            ]),
          );
        },
      ),
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
        currentIndex: _selectedIndex,
      ),
    );
  }
}
