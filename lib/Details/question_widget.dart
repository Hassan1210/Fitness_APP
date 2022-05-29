import 'package:fitness_app/Details/disclaimer.dart';
import 'package:fitness_app/Details/questio3.dart';
import 'package:fitness_app/Details/questio4.dart';
import 'package:fitness_app/Details/question2.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class QuestionWidget extends StatefulWidget {
  const QuestionWidget(
      {Key? key,
      required this.list,
      required this.description,
      required this.title,
      required this.page,
      required this.isDescription})
      : super(key: key);
  final List<String> list;
  final String title;
  final List description;
  final int page;
  final bool isDescription;

  @override
  _QuestionWidgetState createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  int _value = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        widget.page > 1
            ? Stack(
                children: [
                   Padding(
                    padding: const EdgeInsets.only(top: 30, left: 20),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                          child: const Icon(
                        Icons.arrow_back,
                        size: 30,
                      )),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: 80,
                      width: 80,
                    ),
                  ),
                ],
              )
            : Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 80,
                  width: 80,
                ),
              ),
        const SizedBox(
          height: 20,
        ),
        widget.title.text.bold.size(20).black.make().px(20),
        const SizedBox(
          height: 20,
        ),
        for (int i = 1; i < widget.list.length; i++)
          ListTile(
            title: Text(
              widget.list[i],
              style: const TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            subtitle: widget.isDescription == true
                ? Text(
                    widget.description[i],
                    style: const TextStyle(color: Colors.black54),
                  )
                : null,
            leading: Radio(
              activeColor: Colors.pinkAccent,
              value: i,
              groupValue: _value,
              onChanged: (int? value) {
                setState(() {
                  _value = value!.toInt();
                  print(widget.list[_value]);
                });
              },
            ),
          ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
                onPressed: () async {
                  if (widget.page == 1) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Question2()));
                  } else if (widget.page == 2) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Question3()));
                  } else if (widget.page == 3) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Question4()));
                  } else if (widget.page == 4) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Disclaimer()));
                  }
                },
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.pinkAccent),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                  ),
                ),
                child: "Continue".text.make()),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
