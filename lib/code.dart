import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:todo_list/otp.dart';

class code extends StatefulWidget {
  const code({super.key});

  @override
  State<code> createState() => _codeState();
}

class _codeState extends State<code> {
  TextEditingController phonecontroller = TextEditingController();

  final authCred = FirebaseAuth.instance;

  bool isLoading = false;

  Future<void> checkphoneNumber() async {
    try {
      setState(() {
        isLoading = true;
      });
      await authCred.verifyPhoneNumber(
          phoneNumber: '+91${phonecontroller.text}',
          verificationCompleted: (PhoneAuthCredential value) async {
            await authCred.signInWithCredential(value);
          },
          verificationFailed: (FirebaseAuthException e) {
            print('-------------$e');
          },
          codeSent: (String verificationId, int? token) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => otp(verificationId: verificationId)));
          },
          codeAutoRetrievalTimeout: (v) {});
    } catch (e) {
      print('=================$e');
    }
  }

  String phoneNumber = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 245, 124, 87),
        centerTitle: true,
        title: Text(
          "Sign up",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.phone,
              color: Colors.white,
            )),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'enter your phone number',
                  labelText: 'enter phone number',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          ElevatedButton(
              onPressed: checkphoneNumber,
              child: isLoading
                  ? CircularProgressIndicator(
                      color: Colors.orange,
                    )
                  : const Text("verification"))
        ],
      ),
    );
  }
}
