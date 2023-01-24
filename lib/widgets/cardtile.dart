import 'package:classify/pages/edit_classT.dart';
import 'package:classify/widgets/utils.dart';
import 'package:flutter/material.dart';
import '../pages/classes.dart';

class CardList extends StatelessWidget {
  const CardList({
    Key? key,
    required this.widget,
    required this.data,
  }) : super(key: key);

  final Classes widget;
  final data;

  @override
  Widget build(BuildContext context) {
    debugPrint('$day');
    return Flexible(
      child: ListView.builder(
        itemCount: data['$day']!.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.all(20 // (index % 2 == 0) ? 80 : 20,
                ),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditClassT(
                              day: '$day',
                              index: index,
                            )));
              },
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 232, 232, 232),
                  boxShadow: [
                    BoxShadow(
                      color: myColors[widget.themeid]![3],
                      blurRadius: 40,
                      spreadRadius: -15,
                    ),
                  ],
                ),
                child: ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          left: 10,
                        ),
                        child: Text(
                          data['$day']![index][0],
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: myColors[widget.themeid]![2],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          left: 10,
                        ),
                        child: Text(
                          data['$day']![index][1],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            data['$day']![index][2],
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: myColors[widget.themeid]![1],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
