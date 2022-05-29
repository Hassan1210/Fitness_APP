import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/Details/body_detalis.dart';
import 'package:fitness_app/Home/home.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';


class Gender extends StatefulWidget {
  const Gender({Key? key}) : super(key: key);

  @override
  _GenderState createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  int male = 1;
  int female = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 25, left: 16),
              child: Text(
                "Select Gender",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: GestureDetector(
                        onTap: () {
                          female = 1;
                          male = 0;
                          setState(() {});
                        },
                        child: Image.asset("assets/images/female.png")),
                    flex: female == 1 ? 3 : 2,
                  ),
                  Expanded(
                    child: GestureDetector(
                        onTap: (){
                          female = 0;
                          male = 1;
                          setState(() {
                          });
                        },
                        child: Image.asset("assets/images/male.png")),
                    flex: male == 1 ? 3: 2,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: () async{
                    dynamic close = context.showLoading(
                        msg: "Loading", textColor: Colors.white);
                    await saveData();
                    await Future.delayed(1.milliseconds, close);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const BodyDetails()));
                  },
                  style: ButtonStyle(
                    foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.purple),
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                    ),
                  ),
                  child: const Text("Next"),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }

  saveData()async{
    final ref =  FirebaseAuth.instance.currentUser;
    String uid = ref!.uid;

    await FirebaseFirestore.instance.collection("UserData").doc(uid).update({
     "gender": male == 1? "Male":"Female"
    });
  }
}
