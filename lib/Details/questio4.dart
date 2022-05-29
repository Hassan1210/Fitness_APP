import 'package:fitness_app/Details/question_widget.dart';
import 'package:flutter/material.dart';

class Question4 extends StatefulWidget {
  @override
  _Question4State createState() => _Question4State();
}

class _Question4State extends State<Question4> {
  List<String> list = [
    "",
    "Online Advertisement",
    "AimFit social media pages",
    "Friend and Family",
    "Other",
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
          title: "Where did you hear about Aim Fit App?",
          page: 4,
          isDescription: false,),
      ),
    );
  }
}