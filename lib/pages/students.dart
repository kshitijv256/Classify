import 'package:classify/controllers/list_controller_s.dart';
import 'package:classify/widgets/MyCircles.dart';
import 'package:classify/widgets/cardtile.dart';
import 'package:classify/widgets/studentTile.dart';
import 'package:classify/widgets/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

var day = DateTime.now().weekday;

class StudentClasses extends StatefulWidget {
  const StudentClasses({Key? key}) : super(key: key);
  final themeid = 4;

  @override
  State<StudentClasses> createState() => _StudentClassesState();
}

class _StudentClassesState extends State<StudentClasses> {
  @override
  Widget build(BuildContext context) {
    // widget.storage.findpath().then((value) => path = value);
    (day <= 0) ? day = 5 : day = day;
    // (time > 16) ? day += 1 : day;
    (day > 5) ? day = 1 : day;
    return Consumer<ListControllerSt>(
      builder: (context, listController, child) {
        return Container(
          color: Color.fromARGB(255, 30, 25, 51),
          child: Column(
            children: [
              MyCircles(
                themeid: widget.themeid,
                title: days[day - 1],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          day -= 1;
                        });
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: myColors[widget.themeid]![0],
                        size: 32,
                      ),
                    ),
                    Text(
                      "Today's Classes",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: myColors[widget.themeid]![0],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(
                          () {
                            day += 1;
                          },
                        );
                      },
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: myColors[widget.themeid]![0],
                        size: 32,
                      ),
                    )
                  ],
                ),
              ),
              StudentTile(widget: widget, data: listController.classItems),
            ],
          ),
        );
      },
    );
  }
}
