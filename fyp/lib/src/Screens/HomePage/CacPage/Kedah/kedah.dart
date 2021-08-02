import 'package:flutter/material.dart';
import 'package:fyp/src/Screens/HomePage/CacPage/Kedah/body.dart';

class Kedah extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('CAC - Kedah')),
      body: Body(),
    );
  }
}
