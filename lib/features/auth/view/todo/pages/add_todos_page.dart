import 'package:auth/features/auth/bloc/bloc.dart';
import 'package:auth/features/auth/model/model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class AddTodosPage extends StatefulWidget {
  AddTodosPage({Key? key}) : super(key: key);

  @override
  State<AddTodosPage> createState() => _AddTodosPageState();
}

class _AddTodosPageState extends State<AddTodosPage> {
  final _formKey = GlobalKey<FormState>();

  late String _title;
  late String _howto;
  late String _imageurl;
  late String _info;
  late String _category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                onSaved: (val) => _title = val ?? "",
                decoration: const InputDecoration(hintText: 'Title'),
              ),
              TextFormField(
                onSaved: (val) => _howto = val ?? "",
                decoration: const InputDecoration(hintText: 'How-to'),
              ),
              TextFormField(
                onSaved: (val) => _imageurl = val ?? "",
                decoration: const InputDecoration(hintText: 'Image URL'),
              ),
              TextFormField(
                onSaved: (val) => _category = val ?? "",
                decoration: const InputDecoration(hintText: 'Category'),
              ),
              TextFormField(
                onSaved: (val) => _info = val ?? "",
                decoration: const InputDecoration(hintText: 'Info'),
              ),
              ElevatedButton(
                  onPressed: () {
                    _formKey.currentState!.save();
                    context.read<TodoBloc>().add(TodoAdded(Todo(
                          timestamp: Timestamp.now(),
                          title: _title,
                          howto: _howto,
                          imageurl: _imageurl,
                          info: _info,
                          done: false,
                          category: _category,
                        )));
                  },
                  child: const Text("Submit")),
            ],
          )),
    );
  }
}
