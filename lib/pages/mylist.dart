import 'package:classify/controllers/todo_controller.dart';
import 'package:classify/pages/add_todo.dart';
import 'package:classify/widgets/MyCircles.dart';
import 'package:classify/widgets/utils.dart';
import 'package:classify/widgets/stacked_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class MyList extends StatefulWidget {
  const MyList({super.key});

  @override
  State<MyList> createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  void doNothing(BuildContext context) {}
  var themeid = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<TodoController>(builder: (context, todoController, child) {
        return Container(
          color: Color.fromARGB(255, 30, 25, 51),
          child: Column(
            children: [
              MyCircles(themeid: themeid, title: 'My tasks'),
              Flexible(
                child: ListView.builder(
                  itemCount: todoController.todoItems.length,
                  itemBuilder: (
                    BuildContext context,
                    int index,
                  ) {
                    return Slidable(
                      key: Key(todoController.todoItems[index]["title"]),
                      endActionPane: ActionPane(
                        dismissible: DismissiblePane(onDismissed: () {
                          setState(() {
                            // var temp = list3[index];
                            // temp['page'] = 'wishlist';
                            todoController.delete(index: index);
                            // debugPrint(list4.toString());
                          });
                        }),
                        motion: DrawerMotion(),
                        children: [
                          SlidableAction(
                              onPressed: doNothing,
                              backgroundColor: myColors[themeid]![2],
                              foregroundColor: Colors.white,
                              icon: Icons.delete_forever_rounded,
                              borderRadius: BorderRadius.circular(10),
                              label: 'Delete'),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            tileColor: Colors.white,
                            title: Text(
                                todoController.todoItems[index]["title"],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: myColors[themeid]![2])),
                            subtitle: Text(
                                todoController.todoItems[index]["description"],
                                style: TextStyle(
                                    fontSize: 15,
                                    color: myColors[themeid]![1])),
                            trailing: Icon(Icons.arrow_back_ios,
                                color: myColors[themeid]![2]),
                            // backgroundColor: Colors.transparent,
                            // backgroundImage: AssetImage('./assets/images/download.png'),
                            leading: Icon(
                              Icons.star,
                              size: 32,
                              color: myColors[themeid]![3],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
          backgroundColor: myColors[themeid]![2],
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddTodoPage(),
              ),
            );
          },
          child: const Icon(Icons.add, color: Colors.white)),
    );
  }
}
