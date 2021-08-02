import 'package:flutter/material.dart';
import 'package:fyp/src/Screens/HomePage/Hotline/Call/body.dart';

class Call extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('MoH Hospital List')),
      body: Body(),
    );
  }
}
