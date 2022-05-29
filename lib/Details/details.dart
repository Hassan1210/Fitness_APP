import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/Details/gender.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:form_field_validator/form_field_validator.dart';

class Details extends StatefulWidget {
  const Details({Key? key,required this.phone}) : super(key: key);

  final String phone;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    phoneController.text = widget.phone;
  }

  static GlobalKey<FormState> formKey =  GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * .30,
                    width: double.infinity,
                    decoration: BoxDecoration(
                    ),
                    child: Lottie.asset(
                      'assets/animation/runnigGrile.json',
                      fit: BoxFit.contain,
                      width: double.infinity
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * .27,
                    child: Container(
                      height: 7,
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .03,
                          ),
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.pink,
                                  border: Border.all(
                                    color: Colors.red,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20))),
                              width: MediaQuery.of(context).size.width * .30),
                          const SizedBox(
                            width: 6,
                          ),
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.pink,
                                  border: Border.all(
                                    color: Colors.red,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20))),
                              width: MediaQuery.of(context).size.width * .30),
                          const SizedBox(
                            width: 6,
                          ),
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.pink,
                                  border: Border.all(
                                    color: Colors.red,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20))),
                              width: MediaQuery.of(context).size.width * .30),
                        ],
                      ),
                    ), //Icon
                  ), //
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20.0, left: 20),
                child: Text(
                  'Details',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: "Enter Your  Details".text.size(16).black.make()),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Form(
                      key: formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(children: [
                      VxTextField(
                        controller: nameController,
                        labelText: "Full Name",
                        labelStyle: const TextStyle(color: Colors.pink),
                        contentPaddingLeft: 16,
                        cursorColor: Colors.black54,
                        cursorHeight: 24,
                        keyboardType: TextInputType.text,
                        fillColor: Colors.transparent,
                        borderColor: Colors.pinkAccent,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                        validator: RequiredValidator(errorText: "*Required"),
                        onChanged: (value) {},
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      VxTextField(
                        controller: emailController,
                        labelText: "Email",
                        labelStyle: const TextStyle(color: Colors.pink),
                        keyboardType: TextInputType.emailAddress,
                        contentPaddingLeft: 16,
                        cursorColor: Colors.black54,
                        cursorHeight: 24,
                        fillColor: Colors.transparent,
                        borderColor: Colors.pinkAccent,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                        validator: MultiValidator([
                          RequiredValidator(errorText: "*Required"),
                          EmailValidator(errorText: "Not Valid Email"),
                        ]),
                        onChanged: (value) {},
                      ),
                      VxTextField(
                        enabled: false,
                        labelStyle: const TextStyle(color: Colors.pink),
                        controller: phoneController,
                        labelText: "Phone Number",
                        contentPaddingLeft: 16,
                        cursorColor: Colors.black54,
                        contentPaddingTop: 24,
                        fillColor: Colors.transparent,
                        borderColor: Colors.pinkAccent,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                        onChanged: (value) {},
                      ),
                    ])),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                          onPressed: () async{
                            if (formKey.currentState!.validate()) {
                              dynamic close = context.showLoading(
                                  msg: "Loading", textColor: Colors.white);
                              await saveData();
                              await Future.delayed(1.milliseconds, close);
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>const Gender()));
                            }
                          },
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.pinkAccent),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                            ),
                          ),
                          child: "Continue".text.make()),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


  saveData()async{

    final ref =  FirebaseAuth.instance.currentUser;
    String uid = ref!.uid;

    await FirebaseFirestore.instance.collection("UserData").doc(uid).set({
      "name":nameController.text,
      "email": emailController.text,
      'phone': widget.phone,
    });
  }

}
