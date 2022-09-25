import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class TeacherStorage {
  var mydata = {
    // Initial Data
    "1": [
      ["09:30 - 10:30", "F209", "B.Tech 3rd year CSE A", "Class test"],
      ["10:30 - 11:30", "F204", "B.Tech 3rd year CSE B", "Class test"],
      ["11:30 - 12:30", "S305", "B.Tech 2nd year CSE A", "check assignments"],
      ["1:30 - 2:30", "F201", "B.Tech 2nd year CSE B", "check assignments"],
      ["2:30 - 3:30", "LAB3", "B.Tech 3rd year CSE A", "Inheritance in JAVA"],
      ["3:30 - 4:30", "LAB3", "B.Tech 3rd year CSE B", "Inheritance in JAVA"]
    ],
    "2": [
      ["09:30 - 10:30", "F209", "B.Tech 3rd year CSE A", "Class test"],
      ["10:30 - 11:30", "F204", "B.Tech 3rd year CSE B", "Class test"],
      ["11:30 - 12:30", "S305", "B.Tech 2nd year CSE A", "check assignments"],
      ["1:30 - 2:30", "F201", "B.Tech 2nd year CSE B", "check assignments"],
      ["2:30 - 3:30", "LAB3", "B.Tech 3rd year CSE A", "Inheritance in JAVA"],
      ["3:30 - 4:30", "LAB3", "B.Tech 3rd year CSE B", "Inheritance in JAVA"]
    ],
    "3": [
      ["09:30 - 10:30", "F209", "B.Tech 3rd year CSE A", "Class test"],
      ["10:30 - 11:30", "F204", "B.Tech 3rd year CSE B", "Class test"],
      ["11:30 - 12:30", "S305", "B.Tech 2nd year CSE A", "check assignments"],
      ["1:30 - 2:30", "F201", "B.Tech 2nd year CSE B", "check assignments"],
      ["2:30 - 3:30", "LAB3", "B.Tech 3rd year CSE A", "Inheritance in JAVA"],
      ["3:30 - 4:30", "LAB3", "B.Tech 3rd year CSE B", "Inheritance in JAVA"]
    ],
    "4": [
      ["09:30 - 10:30", "F209", "B.Tech 3rd year CSE A", "Class test"],
      ["10:30 - 11:30", "F204", "B.Tech 3rd year CSE B", "Class test"],
      ["11:30 - 12:30", "S305", "B.Tech 2nd year CSE A", "check assignments"],
      ["1:30 - 2:30", "F201", "B.Tech 2nd year CSE B", "check assignments"],
      ["2:30 - 3:30", "LAB3", "B.Tech 3rd year CSE A", "Inheritance in JAVA"],
      ["3:30 - 4:30", "LAB3", "B.Tech 3rd year CSE B", "Inheritance in JAVA"]
    ],
    "5": [
      ["09:30 - 10:30", "F209", "B.Tech 3rd year CSE A", "Class test"],
      ["10:30 - 11:30", "F204", "B.Tech 3rd year CSE B", "Class test"],
      ["11:30 - 12:30", "S305", "B.Tech 2nd year CSE A", "check assignments"],
      ["1:30 - 2:30", "F201", "B.Tech 2nd year CSE B", "check assignments"],
      ["2:30 - 3:30", "LAB3", "B.Tech 3rd year CSE A", "Inheritance in JAVA"],
      ["3:30 - 4:30", "LAB3", "B.Tech 3rd year CSE B", "Inheritance in JAVA"]
    ]
  };

  //  Raed and write data to file

  Future<String> get _localPath async {
    Directory directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/class_teacher.json');
  }

  Future<Map> readFile() async {
    try {
      final file = await _localFile;
      // file.delete();
      if (!await file.exists()) {
        writeFile(mydata);
      }
      final contents = await file.readAsString();

      Map<dynamic, dynamic> classes = jsonDecode(contents);

      return classes;
    } catch (e) {
      return {0: '0'};
    }
  }

  Future<File> writeFile(data) async {
    final file = await _localFile;

    String json = jsonEncode(data);
    // Write the file
    return file.writeAsString(json);
  }

  Future<String> findpath() async {
    final mypath = await _localPath;
    return mypath;
  }
}
