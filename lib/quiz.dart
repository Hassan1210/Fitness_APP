import 'package:flutter/material.dart';
import 'constant.dart';

class Quiz extends StatelessWidget {
  Quiz({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
         const  Padding(
            padding:  EdgeInsets.all(8.0),
            child: Box(height: .25,width: 1,color:color,),
          ),
          Row(
            children: const [
               Padding(
                padding:  EdgeInsets.all(8.0),
                child: Box(height: .25,width: .5,color:color,),
              ),
              Padding(
                padding:  EdgeInsets.all(8.0),
                child: Box(height: .25,width: .5,color:color,),
              ),
            ],
          ),
      Row(
        children: const [
          Padding(
            padding:  EdgeInsets.all(8.0),
            child: Box(height: .25,width: .20,color:color,),
          ),
          Padding(
            padding:  EdgeInsets.all(8.0),
            child: Box(height: .25,width: .80,color:color,),
          ),
        ],),
          Row(
            children: const [
              Padding(
                padding:  EdgeInsets.all(8.0),
                child: Box(height: .25,width: .80,color:color,),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Box(height: .25,width: .20,color:color,),
              ),
            ],)
        ],
      ),
    );
  }
}

class Box extends StatelessWidget {

  final double height;
  final double width;
  final Color color;
  const Box({Key? key,required this.width,required this.height,required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height:  MediaQuery.of(context).size.height * height -16,
      width: MediaQuery.of(context).size.width * width -16,
      color: color,
    );
  }
}


class Screen2 extends StatelessWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding:  EdgeInsets.all(8.0),
            child: Box(width: 1, height: .15, color: color),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Column(
                children: const[
                  Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Box(width: .15, height: .42, color: color),
                  ),
                  Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Box(width: .15, height: .42, color: color),
                  ),
                ],
              ),
              Column(
                children: [
                 const  Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Box(width: .70, height: .15, color: color),
                  ),
                  Row(
                    children: const [
                      Padding(
                        padding:  EdgeInsets.all(8.0),
                        child: Box(width: .35, height: .35, color: color),
                      ),
                      Padding(
                        padding:  EdgeInsets.all(8.0),
                        child: Box(width: .35, height: .35, color: color),
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Padding(
                        padding:  EdgeInsets.all(8.0),
                        child: Box(width: .35, height: .35, color: color),
                      ),
                      Padding(
                        padding:  EdgeInsets.all(8.0),
                        child: Box(width: .35, height: .35, color: color),
                      ),
                    ],
                  ),

                ],
              ),
               Column(
                 children: const [
                    Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Box(width: .15, height: .42, color: color),
              ),
                   Padding(
                     padding:  EdgeInsets.all(8.0),
                     child: Box(width: .15, height: .42, color: color),
                   ),
                 ],
               ),
            ],
          ),

        ],
      ),
    );
  }
}
