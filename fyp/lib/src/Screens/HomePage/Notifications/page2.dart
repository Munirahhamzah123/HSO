import 'package:flutter/material.dart';
import 'package:fyp/src/Screens/HomePage/Notifications/noti_card.dart';
import 'package:fyp/src/Screens/HomePage/Notifications/popoutnoti.dart';

class PageTwo extends StatefulWidget {
  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            NotiCard(),
            SizedBox(height: 30),
            Text("LATEST ANNOUCEMENT",
                style: TextStyle(
                    color: Colors.green.shade900,
                    fontSize: 20,
                    fontWeight: FontWeight.w600)),
            PopoutNoti(),
          ],
        ),
      ),
    );
  }
}
