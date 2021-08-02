import 'package:flutter/material.dart';
import 'package:fyp/src/Screens/HomePage/CacPage/Sabah/body.dart';

class Sabah extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('CAC - Sabah'),
      ),
      body: Body(),
    );
  }
}
