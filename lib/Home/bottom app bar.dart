import 'package:fitness_app/Coach/coach.dart';
import 'package:fitness_app/Home/home.dart';
import 'package:fitness_app/Nutrition/nutrition.dart';
import 'package:flutter/material.dart';

import '../WorkOut/work_out_list.dart';

class Bottom extends StatefulWidget {
  @override
  _BottomState createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  final screen = [
    const Home(),
     Workout(),
    const Nutrition(),
    const Coach()
  ];
  int current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 50,
        selectedItemColor: Colors.pinkAccent,
        iconSize: 30,
        unselectedItemColor: Colors.black54,
        currentIndex: current,
        onTap: (index) => setState(() {
          current = index;
        }),
        items: [
          BottomNavigationBarItem(
              icon: current == 0
                  ? const Icon(
                      Icons.home_outlined,
                      size: 30,
                      color: Colors.pinkAccent,
                    )
                  : const Icon(
                      Icons.home_outlined,
                      size: 30,
                      color: Colors.black,
                    ),
              label: 'Home',
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: current == 1
                  ? Image.asset(
                      "assets/icons/dumble2.png",
                      height: 30,
                      width: 30,
                      color: Colors.pinkAccent,
                    )
                  : Image.asset("assets/icons/dumble2.png",
                      height: 30, width: 30, color: Colors.black),
              label: 'Workout',
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: current == 2
                  ? Image.asset(
                      "assets/icons/apple.png",
                      height: 30,
                      width: 30,
                      color: Colors.pinkAccent,
                    )
                  : Image.asset("assets/icons/apple.png",
                      height: 30, width: 30, color: Colors.black),
              label: 'Nutrition',
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: current == 3
                  ? Image.asset("assets/icons/cocah.png",
                      height: 30, width: 30, color: Colors.black)
                  : Image.asset("assets/icons/cocah.png",
                      height: 30, width: 30, color: Colors.black),
              label: 'Coach',
              backgroundColor: Colors.red),
        ],
      ),
      body: screen[current],
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: null,
    );
  }
}
