import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class otp extends StatefulWidget {
  const otp({super.key});

  @override
  State<otp> createState() => _otpState();
}

class _otpState extends State<otp> {
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
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Text(
                "OTP verification",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Enter the code from the SMS we sent",
                style: TextStyle(color: Color.fromARGB(255, 112, 110, 110)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
