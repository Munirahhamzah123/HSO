import 'package:flutter/material.dart';
import 'package:fyp/src/Screens/HomePage/CacPage/Melaka/body.dart';

class Melaka extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('CAC - Melaka')),
      body: Body(),
    );
  }
}
