import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:classify/controllers/todo_controller.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({Key? key}) : super(key: key);

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  String title = '';
  String description = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add ToDo'),
      ),
      body: Container(
        color: Color.fromARGB(255, 224, 227, 255),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: TextField(
                onChanged: (value) => title = value,
                decoration: const InputDecoration(
                  labelText: 'Title',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: TextField(
                onChanged: (value) => description = value,
                decoration: const InputDecoration(
                  labelText: 'Description',
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final todoController =
              Provider.of<TodoController>(context, listen: false);
          todoController.addTodo(
            title: title,
            description: description,
          );
          Navigator.pop(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
