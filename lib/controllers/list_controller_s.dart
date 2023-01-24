import 'package:classify/main.dart';
import 'package:classify/widgets/teacher.dart';
import 'package:flutter/material.dart';

import '../widgets/student.dart';

void writeDataC() async {
  StudentStorage _store = StudentStorage();
  _store.writeFile(student_data);
}

class ListControllerSt extends ChangeNotifier {
  final _classItems = student_data;

// Getter
  Map<dynamic, dynamic> get classItems => _classItems;

// Adder
  void edit(
      {required String sub,
      required String time,
      required String teacher,
      required String note,
      required String day,
      required int index}) {
    _classItems[day][index] = [
      sub,
      time,
      teacher,
      note,
    ];
    teach_class_data = _classItems;
    writeDataC();
    notifyListeners();
  }
}
