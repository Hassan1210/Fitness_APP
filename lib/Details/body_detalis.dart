import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/Details/target_weight.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:numberpicker/numberpicker.dart';

import '../Home/home.dart';

int feet = 5;
int inches = 0;
int weight = 40;
int waist = 30;
int age = 20;

class BodyDetails extends StatefulWidget {
  const BodyDetails({Key? key}) : super(key: key);

  @override
  State<BodyDetails> createState() => _BodyDetailsState();
}

class _BodyDetailsState extends State<BodyDetails> {
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  final waistController = TextEditingController();
  final ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Center(
                  child: Image.asset(
                "assets/images/logo.png",
                height: 80,
                width: 80,
              )),
              const SizedBox(height: 10),
              "Please enter your details".text.black.bold.size(20).make(),
              const SizedBox(height: 40),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () async {
                        await showDialog(
                            context: context,
                            builder: (_) {
                              return Height();
                            });
                        heightController.text =
                            ((feet * 12) + inches).toString() + "  inches";
                        setState(() {});
                      },
                      child: TextFormField(
                        validator: (value){
                          validation();
                        },
                        controller: heightController,
                        cursorColor: Colors.pink,
                        enabled: false,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        decoration: const InputDecoration(
                          label: Text("Height"),
                          fillColor: Colors.transparent,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.pink),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.pink),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () async {
                        await showDialog(
                            context: context,
                            builder: (_) {
                              return Weight();
                            });
                        weightController.text = weight.toString() + "  Kgs";
                        print(weightController.text);
                        setState(() {});
                      },
                      child: TextFormField(
                        controller: weightController,
                        cursorColor: Colors.pink,
                        enabled: false,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        decoration: const InputDecoration(
                          label: Text("Weight"),
                          fillColor: Colors.transparent,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.pink),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.pink),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () async {
                        await showDialog(
                            context: context,
                            builder: (_) {
                              return Waist();
                            });
                        waistController.text = waist.toString() + "  inches";
                        setState(() {});
                      },
                      child: TextFormField(
                        controller: waistController,
                        cursorColor: Colors.pink,
                        enabled: false,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        decoration: const InputDecoration(
                          label: Text("Waist"),
                          fillColor: Colors.transparent,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.pink),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.pink),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () async {
                        await showDialog(
                            context: context,
                            builder: (_) {
                              return Age();
                            });
                        ageController.text = age.toString() + "  Years";
                        setState(() {});
                      },
                      child: TextFormField(
                        controller: ageController,
                        cursorColor: Colors.pink,
                        enabled: false,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        decoration: const InputDecoration(
                          label: Text("Age"),
                          fillColor: Colors.transparent,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.pink),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.pink),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate() && ageController.text.isNotEmpty &&
                          heightController.text.isNotEmpty &&
                          waistController.text.isNotEmpty &&
                          weightController.text.isNotEmpty) {
                          dynamic close = context.showLoading(
                              msg: "Loading", textColor: Colors.white);
                          await saveData();
                          await Future.delayed(1.milliseconds, close);

                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const TargetWeight()), (route) => false);
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
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }

  showMassage(String error) {
    VxToast.show(
      context,
      msg: error,
      bgColor: Colors.black54,
      textColor: Colors.white,
      pdHorizontal: 20,
      pdVertical: 10,
      showTime: 5000,
      textSize: 18,
    );
  }
  validation() {
    if (heightController.text.isEmpty) {
      showMassage('Height *required');
    }
    else if (weightController.text.isEmpty) {
      showMassage('Weight *required');
    }
    else if (waistController.text.isEmpty) {
      showMassage('Waist *required');
    }
    else if (ageController.text.isEmpty) {
      showMassage('Age *required');
    }
  }


  saveData()async{

    // final ref =  FirebaseAuth.instance.currentUser;
    // String uid = ref!.uid;

    await FirebaseFirestore.instance.collection("BodyData").doc("hhhhhh").set({
      "height" : ((feet * 12) + inches),
      "waist": waist,
      'age': age ,
      'weight' : weight,
    });
  }

}

class Height extends StatefulWidget {
  @override
  _HeightState createState() => _HeightState();
}

class _HeightState extends State<Height> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      content: Container(
        height: 240,
        width: 250,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    "Feet".text.bold.pink400.size(18).make(),
                    const SizedBox(
                      height: 10,
                    ),
                    NumberPicker(
                      selectedTextStyle:
                          const TextStyle(color: Colors.black, fontSize: 25),
                      value: feet,
                      minValue: 1,
                      maxValue: 10,
                      onChanged: (value) => setState(() => feet = value),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    "Inches".text.bold.pink400.size(18).make(),
                    const SizedBox(
                      height: 10,
                    ),
                    NumberPicker(
                      selectedTextStyle:
                          const TextStyle(color: Colors.black, fontSize: 25),
                      value: inches,
                      minValue: 0,
                      maxValue: 11,
                      onChanged: (value) => setState(() => inches = value),
                    ),
                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: "Done".text.bold.pink400.make(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Weight extends StatefulWidget {
  @override
  _WeightState createState() => _WeightState();
}

class _WeightState extends State<Weight> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      content: Container(
        height: 200,
        width: 200,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    NumberPicker(
                      selectedTextStyle:
                          const TextStyle(color: Colors.black, fontSize: 25),
                      value: weight,
                      minValue: 25,
                      maxValue: 150,
                      onChanged: (value) => setState(() => weight = value),
                    ),
                    "Kilograms".text.bold.pink400.size(18).make(),
                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: "Done".text.bold.pink400.make(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Waist extends StatefulWidget {
  @override
  _WaistState createState() => _WaistState();
}

class _WaistState extends State<Waist> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      content: Container(
        height: 200,
        width: 200,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    NumberPicker(
                      selectedTextStyle:
                          const TextStyle(color: Colors.black, fontSize: 25),
                      value: waist,
                      minValue: 20,
                      maxValue: 100,
                      onChanged: (value) => setState(() => waist = value),
                    ),
                    "Inches".text.bold.pink400.size(18).make(),
                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: "Done".text.bold.pink400.make(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Age extends StatefulWidget {
  @override
  _AgeState createState() => _AgeState();
}

class _AgeState extends State<Age> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      content: Container(
        height: 200,
        width: 200,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    NumberPicker(
                      selectedTextStyle:
                          const TextStyle(color: Colors.black, fontSize: 25),
                      value: age,
                      minValue: 15,
                      maxValue: 120,
                      onChanged: (value) => setState(() => age = value),
                    ),
                    "Years".text.bold.pink400.size(18).make(),
                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: "Done".text.bold.pink400.make(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
