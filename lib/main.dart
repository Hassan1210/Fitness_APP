import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/Coach/coach.dart';
import 'package:fitness_app/Details/body_detalis.dart';
import 'package:fitness_app/Details/details.dart';
import 'package:fitness_app/Details/target_weight.dart';
import 'package:fitness_app/Home/bottom%20app%20bar.dart';
import 'package:fitness_app/login/login.dart';
import 'package:fitness_app/login/otp_login.dart';
import 'package:fitness_app/login/otp_register.dart';
import 'package:fitness_app/quiz.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Home/home.dart';
import 'login/welcome.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      MyApp()
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Flutter OTP Verification',
      debugShowCheckedModeBanner: false,
      initialRoute: FirebaseAuth.instance.currentUser==null? 'WelcomeScreen' : 'Home',
      routes: {
        'WelcomeScreen' : (context) => Quiz(),
        'Home' : (context) =>  Screen2(),
      },
    );

  }
}

// void main(){
//
//   patrameterSimple(3,5);
//
//   patrameterRequired(a:3,b:4);
//
//   patrametrDefault(4);
//
//   print("Sum of Numbers is : ${parameterReturn(6,6)}");
//
//   patrameterOptional(3,a:2);
//
//
//
//
//   int b = Sum(a:4,b:4).add();
//   print("Sum of Numbers is : $b");
//
//
//   b = Sum().addNo(4,5);
//   print("Sum of Numbers is : $b");
//
// }
//
// void patrameterSimple(int a, int b){
//
//   int c = a+b;
//   print("Sum of Numbers is : $c");
// }
//
// void patrameterRequired({required int a, required int b}){
//
//   int c = a + b;
//   print("Sum of Numbers is : $c");
// }
//
// int parameterReturn(a,b)=>a+b;
//
//
// void patrameterOptional(int c,{a, b}){
//
//   print("C = $c");
//   print("A = $a");
//   print("B = $b");
// }
//
// void patrametrDefault(int c,[a=5, b]){
//
//   print("C = $c");
//   print("A = $a");
//   print("B = $b");
// }

