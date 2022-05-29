import 'package:fitness_app/Details/question1.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:velocity_x/velocity_x.dart';

int weight = 30;

class TargetWeight extends StatefulWidget {
  const TargetWeight({Key? key}) : super(key: key);

  @override
  _TargetWeightState createState() => _TargetWeightState();
}

class _TargetWeightState extends State<TargetWeight> {
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Icon(Icons.arrow_back),
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
              ),
              const SizedBox(height: 10),
              "Please enter your target weight".text.black.bold.size(20).make(),
              const SizedBox(height: 40),
              Form(
                key: formKey,
                child: InkWell(
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
                    validator: (value){
                      validation();
                    },
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
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate() &&
                          weightController.text.isNotEmpty) {
                        // dynamic close = context.showLoading(
                        //     msg: "Loading", textColor: Colors.white);
                        // await saveData();
                       // await Future.delayed(1.milliseconds, close);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Question1()));
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
    if (weightController.text.isEmpty) {
      showMassage('Weight *required');
    }
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
