import 'package:flutter/material.dart';
import 'package:classify/pages/classes.dart';
import 'utils.dart';

class StackedCards extends StatefulWidget {
  const StackedCards({
    Key? key,
    required this.themeid,
    required this.title,
  }) : super(key: key);

  final int themeid;
  final String title;

  @override
  State<StackedCards> createState() => _StackedCardsState();
}

class _StackedCardsState extends State<StackedCards> {
  @override
  void setSuper(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      color: Colors.transparent,
      child: Stack(
        children: [
          Positioned(
            top: 5,
            right: 15,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.18,
              width: MediaQuery.of(context).size.width * 0.96,
              decoration: BoxDecoration(
                color: myColors[widget.themeid]![2],
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: myColors[widget.themeid]![3],
                    blurRadius: 50,
                    spreadRadius: -12,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 20,
            right: 15,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.16,
              width: MediaQuery.of(context).size.width * 0.84,
              decoration: BoxDecoration(
                color: myColors[widget.themeid]![1],
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: myColors[widget.themeid]![3],
                    blurRadius: 50,
                    spreadRadius: -12,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 35,
            right: 15,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.14,
              width: MediaQuery.of(context).size.width * 0.70,
              decoration: BoxDecoration(
                color: myColors[widget.themeid]![0],
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: myColors[widget.themeid]![3],
                    blurRadius: 50,
                    spreadRadius: -12,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          color: myColors[widget.themeid]![2],
                          blurRadius: 40,
                          offset: const Offset(-3, 0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
