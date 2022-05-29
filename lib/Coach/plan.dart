import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Plan extends StatelessWidget {
  const Plan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE7D6E6),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      size: 30,
                    ),
                  ),
                  Image.asset(
                    "assets/images/logo.png",
                    height: 80,
                    width: 80,
                  ),
                  "".text.make(),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Current Plan".text.gray900.bold.size(18).make(),
                      "No Active Plan".text.bold.size(22).make(),
                    ],
                  ),
                ),
                Container(
                  height: 200,
                  width: 170,
                  child: Image.asset(
                    "assets/images/plan.png",
                  ),
                )
              ],
            ),
            Expanded(
              child: InkWell(
                onTap: () {},
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    color: Colors.white,
                  ),
                  height: double.infinity,
                  width: double.infinity,
                  child: Container(
                    height: MediaQuery.of(context).size.height * .28,
                    width: double.infinity,
                    margin: EdgeInsets.only(
                        top: 30,
                        left: 16,
                        right: 20,
                        bottom: MediaQuery.of(context).size.height * .28),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border:
                            Border.all(color: Colors.pinkAccent, width: 1.5)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              "Subscribe".text.bold.size(16).make(),
                              const SizedBox(
                                width: 20,
                              ),
                              Container(
                                child: "Best Value"
                                    .text
                                    .white
                                    .size(12)
                                    .make()
                                    .p(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.pinkAccent,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              "PKR".text.size(30).bold.blueGray400.make(),
                              const SizedBox(
                                width: 20,
                              ),
                              "2999".text.size(30).bold.blueGray500.make(),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          "1 Month".text.size(20).bold.black.make(),
                          const SizedBox(
                            height: 3,
                          ),
                          "One Click and you all set".text.size(2).black.make(),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              "Auto Renew".text.size(2).blueGray900.bold.make(),
                              const SizedBox(
                                width: 20,
                              ),
                              "Cancel Anytime"
                                  .text
                                  .size(2)
                                  .blueGray900
                                  .bold
                                  .make(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Padding(
// padding: const EdgeInsets.symmetric(horizontal: 16.0),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// const Icon(
// Icons.arrow_back,
// size: 30,
// ),
// Image.asset(
// "assets/images/logo.png",
// height: 80,
// width: 80,
// ),
// "".text.make(),
// ],
// ),
// ),
// ),
// Stack(
// children: [
// Align(
// alignment: Alignment.bottomRight,
// child: Image.asset(
// "assets/images/plan.png",
// height: 200,
// width: 200,
// )),
// Positioned(
// top: 50,
// child: Padding(
// padding: const EdgeInsets.all(20),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// "Current Plan".text.gray900.bold.size(18).make(),
// "No Active Plan".text.bold.size(22).make(),
// ],
// ),
// ),
// ),
// ],
// ),
