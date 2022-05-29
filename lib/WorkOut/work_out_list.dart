import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Workout extends StatelessWidget {
  Workout({Key? key}) : super(key: key);

  List<String> excercise = [
    "Jumping Jacks",
    "Plank",
    "Cross Crunches",
    "Side Plank",
    "Squats",
  ];
  List<String> images = [
    "assets/excerise/jumpjack.png",
    "assets/excerise/plank.png",
    "assets/excerise/CrossCrunches.png",
    "assets/excerise/sideplank.png",
    "assets/excerise/squats.png",
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(""),
                  Image.asset(
                    "assets/images/logo.png",
                    height: 80,
                    width: 80,
                  ),
                  const Icon(Icons.format_align_left, size: 30)
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.filter_list,
                    color: Colors.pink,
                    size: 20.0,
                  ),
                  label: "Filter".text.bold.size(16).pink400.make(),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      width: 1.0,
                      color: Colors.pinkAccent,
                      style: BorderStyle.solid,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: excercise.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.only(top: 15),
                        // color: Colors.red,
                        height: 180,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: const Color(0xFFF8F8F8),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, right: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                images[index],
                                height: 150,
                                width: 150,
                              ),
                              excercise[index]
                                  .text
                                  .bold
                                  .gray600
                                  .size(20).start
                                  .makeCentered()
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
