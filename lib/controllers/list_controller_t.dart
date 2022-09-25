import 'package:classify/main.dart';
import 'package:classify/widgets/teacher.dart';
import 'package:flutter/material.dart';

void writeDataC() async {
  TeacherStorage tch_store = TeacherStorage();
  tch_store.writeFile(teach_class_data);
}

class ListController extends ChangeNotifier {
  final _classItems = teach_class_data;

// Getter
  Map<dynamic, dynamic> get classItems => _classItems;

// Adder
  void edit(
      {required String time,
      required String room,
      required String batch,
      required String note,
      required String day,
      required int index}) {
    _classItems[day][index] = [
      time,
      room,
      batch,
      note,
    ];
    teach_class_data = _classItems;
    writeDataC();
    notifyListeners();
  }
}
