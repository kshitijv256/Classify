import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class StudentStorage {
  var mydata = {
    "1": [
      ["GSC606", "9:30 - 10:30", "AKM"],
      ["CN LAB // Complier Design LAB", "10:30 - 12:30", "JAD/PKB"],
      ["DL & NN", "1:30 - 2:30", "SGH"],
      ["Big Data", "2:30 - 3:30", "UDI"],
      ["OR & NM", "3:30 - 4:30", "PMK"]
    ],
    "2": [
      ["CN", "9:30 - 10:30", "JAD"],
      ["DL & NN", "10:30 - 11:30", "SGH"],
      ["Graphics", "11:30 - 12:30", "JKL"],
      ["GSC606", "1:30 - 2:30", "VKS"],
      ["Complier Design LAB // CN LAB", "2:30 - 4:30", "PKB/JAD"]
    ],
    "3": [
      ["Compiler Design", "9:30 - 10:30", "PKB"],
      ["CN", "10:30 - 11:30", "JAD"],
      ["Big Data", "11:30 - 12:30", "UDI"],
      ["Compiler Design", "1:30 - 2:30", "PKB"],
      ["DL && NN LAB // Big Data LAB", "2:30 - 4:30", "SGH/UDI"]
    ],
    "4": [
      ["OR & NM", "9:30 - 10:30", "PMK"],
      ["Big Data LAB // DL && NN LAB", "10:30 - 12:30", "UDI/SGH"],
      ["Grahics", "1:30 - 2:30", "JKL"],
      ["Big Data", "2:30 - 3:30", "UDI"],
      ["GSC606", "3:30 - 4:30", "DJK"]
    ],
    "5": [
      ["DL & NN", "9:30 - 10:30", "SGH"],
      ["CN", "10:30 - 11:30", "JAD"],
      ["Compiler Design", "11:30 - 12:30", "PKB"],
      ["OR && NM", "1:30 - 2:30", "PMK"],
      ["Computer Graphics LAB", "2:30 - 4:30", "DCE/JKL"]
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
