import 'package:fitness_app/Home/bottom%20app%20bar.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Home/home.dart';

class Disclaimer extends StatelessWidget {
  const Disclaimer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/images/logo.png',
                height: 80,
                width: 80,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            'Disclaimer'.text.bold.size(20).black.make().px(20),
            const SizedBox(
              height: 20,
            ),
            "hsahdfkkbhdhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh"
                    "hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhbczb,,dm.akd.ksfksjdf"
                .text
                .size(18)
                .gray900
                .make()
                .px(20),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    onPressed: () async {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Bottom()),
                          (route) => false);
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
                    child: "I accept".text.make()),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
