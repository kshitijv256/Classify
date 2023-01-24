import 'package:classify/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/list_controller_s.dart';

class EditClassS extends StatefulWidget {
  const EditClassS({Key? key, required this.day, required this.index})
      : super(key: key);
  final String day;
  final int index;

  @override
  State<EditClassS> createState() => _EditClassSState();
}

class _EditClassSState extends State<EditClassS> {
  @override
  Widget build(BuildContext context) {
    String sub = student_data[widget.day]![widget.index][0];
    String time = student_data[widget.day]![widget.index][1];
    String teacher = student_data[widget.day]![widget.index][2];
    String note = student_data[widget.day]![widget.index][3];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Class'),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: Color.fromARGB(255, 224, 227, 255),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: TextFormField(
                  initialValue: sub,
                  onChanged: (value) => sub = value,
                  decoration: const InputDecoration(
                    labelText: 'Subject',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: TextFormField(
                  initialValue: time,
                  onChanged: (value) => time = value,
                  decoration: const InputDecoration(
                    labelText: 'Timing',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: TextFormField(
                  initialValue: teacher,
                  onChanged: (value) => teacher = value,
                  decoration: const InputDecoration(
                    labelText: 'Teacher',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: TextFormField(
                  minLines: 1,
                  maxLines: 5,
                  initialValue: note,
                  onChanged: (value) => note = value,
                  decoration: const InputDecoration(
                    labelText: 'Note',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final listController =
              Provider.of<ListControllerSt>(context, listen: false);
          listController.edit(
            sub: sub,
            time: time,
            teacher: teacher,
            note: note,
            day: widget.day,
            index: widget.index,
          );
          Navigator.pop(context);
        },
        child: const Icon(Icons.check_outlined),
      ),
    );
  }
}
