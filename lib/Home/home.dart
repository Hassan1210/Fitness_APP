import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../login/welcome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData()async{
    final ref =  FirebaseAuth.instance.currentUser;
    String uid = ref!.uid;

    final refe = FirebaseFirestore.instance.collection('UserData');
    final data = await refe.doc(uid).get();
    name = data['name'];
    email = data['email'];
    gender = data['gender'];
    setState(() {
    });
  }

  String? name;
  String? email;
  String? gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Home".text.makeCentered(),
        actions: [
          IconButton(onPressed: (){
            FirebaseAuth.instance.signOut();
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Welcome()),
                    (route) => false);
          }, icon: const Icon(Icons.logout))
        ],
      ),
      body:Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(name.toString()),
            const SizedBox(height: 10,),
            Text(email.toString()),
            const SizedBox(height: 10,),
            Text(gender.toString()),
          ],
        ),
      )
    );
  }
}
