import 'package:flutter/material.dart';
import 'package:fyp/src/Screens/HomePage/CacPage/Sarawak/body.dart';

class Sarawak extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('CAC - Sarawak'),
      ),
      body: Body(),
    );
  }
}
