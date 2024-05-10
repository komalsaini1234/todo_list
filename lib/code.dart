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
            padding: const EdgeInsetsDirectional.all(70),
            child: InternationalPhoneNumberInput(
              onInputChanged: (PhoneNumber number) {
                print(number.phoneNumber);
              },
              inputDecoration: InputDecoration(
                  labelText: 'PHONE NUMBER', border: OutlineInputBorder()),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => otp(),
                    ));
              },
              child: Text(
                "verify",
                style: TextStyle(
                    fontSize: 20,
                    color: const Color.fromARGB(255, 245, 124, 87),
                    fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }
}
