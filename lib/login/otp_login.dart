import 'package:fitness_app/Home/bottom%20app%20bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Home/home.dart';

class OptLogin extends StatefulWidget {
  OptLogin({required this.phone});

  final String phone;

  @override
  _OptLoginState createState() => _OptLoginState();
}

class _OptLoginState extends State<OptLogin> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginUser(widget.phone);
  }

  String? verId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff7f6fb),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * .30,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                  ),
                  child: Lottie.asset(
                    'assets/animation/pushupsman.json',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(
                        Icons.arrow_back,
                        size: 32,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * .27,
                  child: Container(
                    height: 7,
                    child: Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .02,
                        ),
                        Container(
                            decoration: BoxDecoration(
                              color: Colors.red,
                                border: Border.all(
                                  color: Colors.red,
                                ),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(20))),
                            width: MediaQuery.of(context).size.width * .47),
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
                            width: MediaQuery.of(context).size.width * .47),
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
                'Verify',
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
                child:
                "Enter Your  Code ".text.size(16).black.make()),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22.0),
                  child: PinFieldAutoFill(
                    decoration: const UnderlineDecoration(
                      textStyle:
                          TextStyle(fontSize: 20, color: Colors.black),
                      colorBuilder:
                          FixedColorBuilder(Colors.pinkAccent),
                    ),
                    currentCode: "",
                    onCodeSubmitted: (code) {},
                    onCodeChanged: (code) async {
                      if (code!.length == 6) {
                        FocusScope.of(context).requestFocus(FocusNode());
                      }
                      if (code.length == 6) {
                        SystemChannels.textInput.invokeMethod('TextInput.hide');
                        dynamic close = context.showLoading(
                            msg: "Loading", textColor: Colors.white);
                        signIn(code, close);
                      }
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children : [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Did not receive SMS".text.pink900.make(),
                      const SizedBox(height: 5,),
                      "Resend SMS again".text.size(16).underline.bold.make(),
                    ],
                  ),
                  ElevatedButton(onPressed: (){},
                      style:  ButtonStyle(
                        foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.pinkAccent),
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                        ),
                      ),
                      child: "Continue".text.make()),],
              ).px(20),
            )
          ],
        ),
      ),
    );
  }

  loginUser(String phone) async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    _auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) async {
          Navigator.of(context).pop();
          final result = await _auth.signInWithCredential(credential);
          User? user = result.user;

          if (user != null) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Bottom()));
          } else {
            print("Error");
          }

          //This callback would gets called when verification is done auto maticlly
        },
        verificationFailed: (FirebaseException exception) {
          print(exception.message);
        },
        codeSent: (String? verificationId, [int? forceResendingToken]) {
          verId = verificationId;
        },
        codeAutoRetrievalTimeout: (String id) {
          print(id);
        });
  }

  signIn(String code, dynamic close) async {
    FocusScope.of(context).requestFocus(FocusNode());
    try {
      FirebaseAuth _auth = FirebaseAuth.instance;

      AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verId.toString(), smsCode: code);

      final result = await _auth.signInWithCredential(credential);

      User? user = result.user;

      if (user != null) {
        Future.delayed(1.milliseconds, close);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Bottom()));
      } else {
        print("Error");
      }
    } catch (e) {
      Future.delayed(1.milliseconds, close);
      showMassage();
    }
  }

  showMassage() {
    VxToast.show(
      context,
      msg: "Invalid OTP",
      bgColor: Colors.black54,
      textColor: Colors.white,
      pdHorizontal: 20,
      pdVertical: 10,
      showTime: 5000,
      textSize: 18,
    );
  }
}
