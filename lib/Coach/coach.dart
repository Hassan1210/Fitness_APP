import 'package:fitness_app/Coach/chat.dart';
import 'package:fitness_app/Coach/plan.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Coach extends StatefulWidget {
  const Coach({Key? key}) : super(key: key);

  @override
  _CoachState createState() => _CoachState();
}

class _CoachState extends State<Coach> {
  double height = 80.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              height == 80
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          height = 200;
                        });
                      },
                      child: Container(
                        height: height,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            border: Border.all(
                                color: Colors.pinkAccent, width: 1.5)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              const CircleAvatar(
                                backgroundColor: Color(0xFFF0F0F0),
                                radius: 25,
                                child: Icon(
                                  Icons.lock_open_rounded,
                                  color: Colors.black54,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  "Coach".text.bold.size(16).make(),
                                  "Got question? Talk to your coach NOW!"
                                      .text.size(10)
                                      .blueGray500
                                      .make()
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  : Container(
                      height: MediaQuery.of(context).size.height * .27-1.1,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border:
                              Border.all(color: Colors.pinkAccent, width: 1.5)),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "Welcome!".text.bold.size(18).make(),
                            const SizedBox(
                              height: 20,
                            ),
                            "Upgrade your plan now to get your own personal coach, "
                                    "who will motivate and guide you "
                                    "through your workouts and meal plan."
                                .text
                                .blueGray500
                                .make(),
                            const SizedBox(
                              height: 27,
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Plan()));
                                  },
                                  style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.pinkAccent),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                    ),
                                  ),
                                  child: "Upgrade to premium".text.make()),
                            ),
                          ],
                        ),
                      ),
                    ),
              const SizedBox(height: 20,),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Chat()));
                },
                child: Container(
                  height: 80,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      border: Border.all(
                          color: Colors.pinkAccent, width: 1.5)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children:  [
                         const CircleAvatar(
                          backgroundColor: Color(0xFFF0F0F0),
                          radius: 25,
                          child: Icon(
                            Icons.headset_mic_outlined,
                            color: Colors.black54,
                          ),
                        ),
                         const SizedBox(
                          width: 20,
                        ),
                        Align(
                          child: "Customer Support".text.black.bold.size(20).make(),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      foregroundColor:
                      MaterialStateProperty.all<Color>(
                          Colors.white),
                      backgroundColor:
                      MaterialStateProperty.all<Color>(
                          Colors.pinkAccent),
                      shape: MaterialStateProperty.all<
                          RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(24.0),
                        ),
                      ),
                    ),
                    child: "Upgrade to premium".text.make()),
              ),
              const SizedBox(height: 30,),
            ],
          ),
        ),
      ),
    );
  }
}
