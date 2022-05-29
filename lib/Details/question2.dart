import 'package:fitness_app/Details/question_widget.dart';
import 'package:flutter/material.dart';


class Question2 extends StatefulWidget {
  @override
  _Question2State createState() => _Question2State();
}

class _Question2State extends State<Question2> {
  List<String> list = [
    "",
    "Fat Lose",
    "Improve Fitness",
    "Improve Mobility",
    "Build Strength",
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
          title: "Which of the following best you describe you?",
          page: 2,
        isDescription: true,),
      ),
    );
  }
}