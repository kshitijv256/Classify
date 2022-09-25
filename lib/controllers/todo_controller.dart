import 'package:classify/main.dart';
import 'package:classify/widgets/todolist.dart';
import 'package:flutter/material.dart';

void writeDataT() async {
  TodoList list_store = TodoList();
  list_store.writeFile(todo_list);
}

class TodoController extends ChangeNotifier {
  final _todoItems = todo_list;

// Getter
  List get todoItems => _todoItems;

// Adder
  void addTodo({required String title, required String description}) {
    _todoItems.add({
      "title": title,
      "description": description,
    });
    writeDataT();
    notifyListeners();
  }

  void delete({required int index}) {
    _todoItems.removeAt(index);
    writeDataT();
    notifyListeners();
  }
}
