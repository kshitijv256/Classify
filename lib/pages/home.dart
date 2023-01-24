import 'package:classify/pages/students.dart';
import 'package:classify/widgets/student.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../widgets/utils.dart';
import 'classes.dart';
import 'mylist.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pages = {
    1: const StudentClasses(),
    2: const Classes(),
    3: const MyList(),
  };
  final themes = {
    1: 4,
    2: 3,
    3: 0,
  };
  int pageid = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageid],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 38, 38, 40),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: myColors[themes[pageid]]![2],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: myColors[themes[pageid]]![1],
              gap: 10,
              padding: EdgeInsets.all(16),
              tabs: [
                GButton(
                  icon: Icons.schedule_rounded,
                  text: "Student",
                  onPressed: () => {
                    setState(
                      () {
                        pageid = 1;
                      },
                    )
                  },
                ),
                GButton(
                  icon: Icons.schedule_rounded,
                  text: "Teachers",
                  onPressed: () => {
                    setState(
                      () {
                        pageid = 2;
                      },
                    )
                  },
                ),
                GButton(
                  icon: Icons.pending_rounded,
                  text: "Pending Task",
                  onPressed: () => {
                    setState(
                      () {
                        pageid = 3;
                      },
                    )
                  },
                ),
              ]),
        ),
      ),
    );
  }
}
