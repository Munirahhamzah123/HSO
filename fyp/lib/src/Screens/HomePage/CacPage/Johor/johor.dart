import 'package:flutter/material.dart';
import 'package:fyp/src/Screens/HomePage/CacPage/Johor/body.dart';

class Johor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('CAC - Johor')),
      body: Body(),
    );
  }
}
