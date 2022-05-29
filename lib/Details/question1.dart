import 'package:fitness_app/Details/question_widget.dart';
import 'package:flutter/material.dart';

class Question1 extends StatefulWidget {
  @override
  _Question1State createState() => _Question1State();
}

class _Question1State extends State<Question1> {
  List<String> list = [
    "",
    "Student",
    "Working Man",
    "Working Woman",
    "Working Mother",
    "HomeMaker",
    "Other"
  ];
  List <String> description =  [
    "","","","","","","",
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: QuestionWidget(
            list: list,
            description: description,
            isDescription: false,
            title: "Which of the following best you describe you?",
        page: 1,),
      ),
    );
  }
}


