import 'package:fitness_app/Details/question_widget.dart';
import 'package:flutter/material.dart';

class Question3 extends StatefulWidget {
  @override
  _Question3State createState() => _Question3State();
}

class _Question3State extends State<Question3> {
  List<String> list = [
    "",
    "Beginner",
    "Intermediate",
    "Advance",
  ];

  List<String> description = [
    "",
    "Target healthy weight loss while you gain and strengthen lean muscle mass",
    "Target healthy weight loss while you gain and strengthen lean muscle mass",
    "Target healthy weight loss while you gain and strengthen lean muscle mass",
    "Target healthy weight loss while you gain and strengthen lean muscle mass",
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: QuestionWidget(
          list: list,
          description: description,
          title: "What is your fitness level?",
          page: 3,
          isDescription: true,),
      ),
    );
  }
}