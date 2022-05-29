import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Nutrition extends StatelessWidget {
  const Nutrition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  expandedHeight: MediaQuery.of(context).size.height * .33,
                  floating: true,
                  //pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: FittedBox(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        .10),
                                child: SizedBox(
                                    child: "Your Portion\nGuide"
                                        .text
                                        .bold
                                        .xl
                                        .size(20)
                                        .white
                                        .make()
                                        .px(16)),
                              ),
                              SizedBox(
                                  child: "Follow this guide, stick to your portions every "
                                          "day and see those results come through"
                                      .text
                                      .size(16)
                                      .white
                                      .make()
                                      .px(16)),
                            ],
                          ),
                        ),
                      ),
                      background: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(40),
                        ),
                        child: Image.asset(
                          "assets/images/meal2.jpg",
                          fit: BoxFit.cover,
                        ),
                      )),
                ),
              ];
            },
            body: ListView.builder(
                itemCount: 8,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: index ==0? Padding(
                      padding: const EdgeInsets.only(top: 10,bottom: 5),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Column(
                          children: [
                            OutlinedButton.icon(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.refresh,
                                color: Colors.pink,
                                size: 24.0,
                              ),
                              label: "Reset".text.bold.size(16).pink400.make(),
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
                            )
                          ],
                        ),
                      ),
                    ) : Card(
                      color: const Color(0xFFF0F0F0),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/meals/meal1.png'),
                                backgroundColor: Colors.transparent,
                                radius: 30,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        "Carbs".text.bold.black.make(),
                                        "4 Portions"
                                            .text
                                            .bold
                                            .pink600
                                            .make()
                                      ],
                                    ),
                                    "Target healthy weight loss while you gain and "
                                            "strengthen lean muscle mass"
                                        .text
                                        .blueGray500
                                        .make()
                                  ],
                                ),
                              )
                            ]),
                      ),
                    ),
                  );
                })),
      ),
    );
  }
}

// Column(
// children: [
// Stack(
// children: [
// Container(
// width: double.infinity,
// height: MediaQuery.of(context).size.height * .33,
// decoration: const BoxDecoration(
// image: DecorationImage(
// image: AssetImage("assets/images/meal2.jpg"),
// fit: BoxFit.cover,
// colorFilter:
// ColorFilter.mode(Colors.pink, BlendMode.color),
// ),
// borderRadius: BorderRadius.only(
// bottomLeft: Radius.circular(30),
// bottomRight: Radius.circular(40),
// )),
// ),
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Padding(
// padding: EdgeInsets.only(
// top: MediaQuery.of(context).size.height * .13),
// child: SizedBox(
// child: "Your Portion\nGuide"
// .text
//     .bold
//     .xl
//     .size(30)
// .white
//     .make()
// .px(16)),
// ),
// SizedBox(
// child:
// "Follow this guide, stick to your portions every "
// "day and see those results come through"
// .text
//     .size(16)
// .white
//     .bold
//     .make()
// .px(16)),
// ],
// ),
// ],
// ),
// const SizedBox(
// height: 20,
// ),
// Padding(
// padding: const EdgeInsets.symmetric(horizontal: 16.0),
// child: Align(
// alignment: Alignment.bottomRight,
// child: Column(
// children: [
// OutlinedButton.icon(
// onPressed: () {},
// icon: const Icon(
// Icons.refresh,
// color: Colors.pink,
// size: 24.0,
// ),
// label: "Reset".text.bold.size(16).pink400.make(),
// style: OutlinedButton.styleFrom(
// side: const BorderSide(
// width: 1.0,
// color: Colors.pinkAccent,
// style: BorderStyle.solid,
// ),
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(24.0),
// ),
// ),
// )
// ],
// ),
// ),
// ),
// Expanded(
// child: ListView.builder(
// itemCount: 8,
// itemBuilder: (BuildContext context, int index) {
// return Padding(
// padding: const EdgeInsets.symmetric(horizontal: 16),
// child: Card(
// child: Padding(
// padding: const EdgeInsets.all(10),
// child: ListTile(
// leading:  const CircleAvatar(
// backgroundColor: Colors.transparent,
// backgroundImage: AssetImage("assets/meals/meal1.png"),
// radius: 40,
// ),
// trailing: const Text(
// "GFG",
// style: TextStyle(color: Colors.green, fontSize: 15),
// ),
// title: Text("List item $index")),
// ),
// ),
// );
// }),
// )
// ],
// ),
// ),
