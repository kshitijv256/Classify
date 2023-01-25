import 'package:classify/controllers/list_controller_s.dart';
import 'package:classify/pages/splash.dart';
import 'package:classify/widgets/student.dart';
import 'package:classify/widgets/teacher.dart';
import 'package:classify/widgets/todolist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/list_controller_t.dart';
import 'controllers/todo_controller.dart';

var teach_class_data;
var student_data;
var todo_list;
void loadData() async {
  TeacherStorage teach_store = TeacherStorage();
  teach_store.readFile().then((value) => teach_class_data = value);

  StudentStorage std_store = StudentStorage();
  std_store.readFile().then((value) => student_data = value);

  TodoList list_store = TodoList();
  list_store.readFile().then((value) => todo_list = value);
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  loadData();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ListController(),
        ),
        ChangeNotifierProvider(
          create: (_) => ListControllerSt(),
        ),
        ChangeNotifierProvider(
          create: (_) => TodoController(),
        ),
      ],
      child: MaterialApp(
        title: 'Classify',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          fontFamily: 'open_sans',
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
