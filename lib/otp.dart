import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/todo.dart';

class otp extends StatefulWidget {
  final String verificationId;

  const otp({super.key, required this.verificationId});

  @override
  State<otp> createState() => _otpState();
}

class _otpState extends State<otp> {
  TextEditingController otpcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 245, 124, 87),
        centerTitle: true,
        title: const Text(
          "Sign up",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.phone,
              color: Colors.white,
            )),
      ),
      body: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 40),
              child: Text(
                "OTP verification",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Enter the code from the SMS we sent",
                style: TextStyle(color: Color.fromARGB(255, 112, 110, 110)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "enter otp",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                controller: otpcontroller,
                keyboardType: TextInputType.number,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  try {
                    PhoneAuthCredential cred = PhoneAuthProvider.credential(
                        verificationId: widget.verificationId,
                        smsCode: otpcontroller.text);

                    FirebaseAuth.instance
                        .signInWithCredential(cred)
                        .then((value) => {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const todo()),
                                (route) => false,
                              )
                              // Navigator.pushNamed(context, loginRoute)
                            });
                  } catch (e) {
                    print('-error==$e');
                  }
                },
                child: const Text('submit'))
          ],
        ),
      ),
    );
  }
}
