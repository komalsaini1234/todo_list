import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class whatsapp extends StatefulWidget {
  const whatsapp({super.key});

  @override
  State<whatsapp> createState() => _whatsappState();
}

class _whatsappState extends State<whatsapp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                launchUrl(Uri.parse('https://wa.me/+918168908152'));
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    color: const Color(0xffFDFDFD),
                    border: Border.all(width: .5),
                    borderRadius: BorderRadius.circular(5)),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.chat,
                        size: 18,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Center(
                        child: Text(
                          'Chat with us',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
