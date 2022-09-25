import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class TodoList {
  var mydata = [];
  Future<String> get _localPath async {
    Directory directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/todolist.json');
  }

  Future<List> readFile() async {
    try {
      final file = await _localFile;
      // file.delete();
      if (!await file.exists()) {
        writeFile(mydata);
      }
      final contents = await file.readAsString();

      List classes = jsonDecode(contents);

      return classes;
    } catch (e) {
      return [];
    }
  }

  Future<File> writeFile(data) async {
    final file = await _localFile;

    String json = jsonEncode(data);
    // Write the file
    return file.writeAsString(json);
  }
}
