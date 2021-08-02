import 'package:flutter/material.dart';
import 'package:fyp/src/Screens/HomePage/CacPage/Selangor/body.dart';

class Selangor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('CAC - Selangor'),
      ),
      body: Body(),
    );
  }
}
