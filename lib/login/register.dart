import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'otp_register.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:velocity_x/velocity_x.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff7f6fb),
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
                      'assets/animation/crunches.json',
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
                  'Wellcome',
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
                  child: "Enter Your  Phone Number ".text.size(16).black.make()),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  HStack(
                    [
                      Image.asset(
                        'assets/images/flag.png',
                        height: 35,
                        width: 35,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      "+92".text.bold.black.size(20).make(),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.only(right: 40.0),
                        child: VxTextField(
                          controller: phoneController,
                          contentPaddingLeft: 16,
                          cursorColor: Colors.black54,
                          contentPaddingTop: 24,
                          cursorHeight: 24,
                          fillColor: Colors.transparent,
                          maxLength: 10,
                          keyboardType: TextInputType.number,
                          borderColor: Colors.pinkAccent,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                          onChanged: (value) {
                            if(value.length == 10)
                            {
                              SystemChannels.textInput.invokeMethod('TextInput.hide');
                            }
                          },
                        ),
                      )),
                    ],
                  ).px(20),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (phoneController.text.length == 10) {
                            dynamic close = context.showLoading(
                                msg: "Loading", textColor: Colors.white);
                            bool check =
                                await checkUser('+92${phoneController.text}');
                            if (check) {
                              await Future.delayed(1.milliseconds, close);
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => OtpRegister(
                                          phone: "+92${phoneController.text}",
                                        )),
                              );
                            } else {
                              await Future.delayed(1.milliseconds, close);
                              showMassage("This user is already exists");
                            }
                          } else {
                            showMassage("Invalid phone number");
                          }
                        },
                        style: ButtonStyle(
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
                        child: const Padding(
                          padding: EdgeInsets.all(14.0),
                          child: Text(
                            'Send',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  "Already have account".text.size(16).pink900.makeCentered(),
                  const SizedBox(
                    height: 5,
                  ),
                  "Login here".text.size(18).underline.pink900.makeCentered(),
                  const SizedBox(
                    height: 30,
                  ),
                  HStack([
                    "By continuing you accept our "
                        .text
                        .size(16)
                        .pink900
                        .makeCentered(),
                    "Privacy Policy"
                        .text
                        .size(16)
                        .bold
                        .underline
                        .black
                        .makeCentered(),
                  ]),
                  HStack([
                    "our ".text.size(16).pink900.makeCentered(),
                    "Term of use"
                        .text
                        .size(16)
                        .bold
                        .underline
                        .black
                        .makeCentered(),
                  ])
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> checkUser(String phone) async {
    final ref = FirebaseFirestore.instance.collection('Phone');
    final data = await ref.doc(phone).get();
    if (data.exists) {
      return false;
    } else {
      return true;
    }
  }

  showMassage(String msg) {
    VxToast.show(
      context,
      msg: msg,
      bgColor: Colors.black54,
      textColor: Colors.white,
      pdHorizontal: 20,
      pdVertical: 10,
      showTime: 3000,
      textSize: 18,
    );
  }
}
