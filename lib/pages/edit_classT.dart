import 'package:classify/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/list_controller_t.dart';

class EditClassT extends StatefulWidget {
  const EditClassT({Key? key, required this.day, required this.index})
      : super(key: key);
  final String day;
  final int index;

  @override
  State<EditClassT> createState() => _EditClassTState();
}

class _EditClassTState extends State<EditClassT> {
  @override
  Widget build(BuildContext context) {
    String time = teach_class_data[widget.day]![widget.index][0];
    String room = teach_class_data[widget.day]![widget.index][1];
    String batch = teach_class_data[widget.day]![widget.index][2];
    String note = teach_class_data[widget.day]![widget.index][3];
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  initialValue: room,
                  onChanged: (value) => room = value,
                  decoration: const InputDecoration(
                    labelText: 'Room',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: TextFormField(
                  initialValue: batch,
                  onChanged: (value) => batch = value,
                  decoration: const InputDecoration(
                    labelText: 'Class',
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
              Provider.of<ListController>(context, listen: false);
          listController.edit(
            time: time,
            room: room,
            batch: batch,
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
