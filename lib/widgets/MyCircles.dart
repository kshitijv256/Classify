import 'package:classify/widgets/utils.dart';
import 'package:flutter/material.dart';

class MyCircles extends StatelessWidget {
  const MyCircles({
    Key? key,
    required this.themeid,
    required this.title,
  }) : super(key: key);

  final int themeid;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Container(
          // material design
          height: 200,
          width: MediaQuery.of(context).size.width,
          color: Colors.transparent,
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: myColors[themeid]![1],
                ),
              ),
            ),
          ),
        ),
        Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(200),
              ),
              color: myColors[themeid]![2],
              boxShadow: [
                BoxShadow(
                  color: myColors[themeid]![3],
                  blurRadius: 50,
                  spreadRadius: -12,
                ),
              ]),
        ),
        Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(150),
            ),
            color: myColors[themeid]![1],
            boxShadow: [
              BoxShadow(
                color: myColors[themeid]![3],
                blurRadius: 50,
                spreadRadius: -12,
              ),
            ],
          ),
        ),
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(100),
              ),
              color: myColors[themeid]![0],
              boxShadow: [
                BoxShadow(
                  color: myColors[themeid]![3],
                  blurRadius: 50,
                  spreadRadius: -12,
                ),
              ]),
        ),
      ],
    );
  }
}
