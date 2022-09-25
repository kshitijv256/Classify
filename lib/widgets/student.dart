import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class StudentStorage {
  var mydata = {
    "1": [
      ["ESP & SDP", "9:30 - 10:30", "Ankit Kumar Sharma", ""],
      ["JAVA // DBMS LAB", "10:30 - 12:30", "Uma Devi"],
      ["AUTOMATA", "1:30 - 2:30", "Sagarika Ghosh"],
      ["DBMS", "2:30 - 3:30", "Jyoti Anand"],
      ["INDIAN CONSTITUTION", "3:30 - 4:30", "Vivek Kumar Sharma"]
    ],
    "2": [
      ["ARTIFICIAL INTELLIGENCE", "9:30 - 10:30", "Rupayan Das", ""],
      ["MANAGEMENT", "10:30 - 11:30", "K.V.Kuriakose", ""],
      ["SOFTWARE ENGINEERING", "11:30 - 12:30", "Mrinal Kanti Sarkar", ""],
      ["ALL IN ONE", "1:30 - 2:30", "Vivek Kumar Sharma", ""],
      ["DBMS // JAVA LAB", "2:30 - 4:30", "Jyoti Anand", ""]
    ],
    "3": [
      ["DBMS", "9:30 - 10:30", "Jyoti Anand", ""],
      ["AUTOMATA", "10:30 - 11:30", "Sagarika Ghosh", ""],
      ["MANAGEMENT", "11:30 - 12:30", "K.V.Kuriakose", ""],
      ["JAVA", "1:30 - 2:30", "Uma Devi", ""],
      ["AIML // SWE LAB", "2:30 - 4:30", "Rupayan Das", ""]
    ],
    "4": [
      ["SOFTWARE ENGINEERING", "9:30 - 10:30", "Mrinal Kanti Sarkar", ""],
      ["SWE // AIML LAB", "10:30 - 12:30", "Subrat Gautam", ""],
      ["ARTIFICIAL INTELLIGENCE", "1:30 - 2:30", "Rupayan Das", ""],
      ["JAVA", "2:30 - 3:30", "Uma Devi", ""],
      ["ENGLISH", "3:30 - 4:30", "Mr. Gourab Goswami", ""]
    ],
    "5": [
      ["DBMS", "9:30 - 10:30", "Jyoti Anand", ""],
      ["AUTOMATA", "10:30 - 11:30", "Sagarika Ghosh", ""],
      ["JAVA", "11:30 - 12:30", "Uma Devi", ""],
      ["SOFTWARE ENGINEERING", "1:30 - 2:30", "Subrat Gautam", ""],
      ["ARTIFICIAL INTELLIGENCE", "2:30 - 3:30", "Rupayan Das", ""],
      ["PROJECT GUIDE", "3:30 - 4:30", "MENTOR", ""]
    ]
  };
  Future<String> get _localPath async {
    Directory directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/class_student.json');
  }

  Future<Map> readFile() async {
    try {
      final file = await _localFile;
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
