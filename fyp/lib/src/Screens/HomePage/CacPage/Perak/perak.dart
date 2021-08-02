import 'package:flutter/material.dart';
import 'package:fyp/src/Screens/HomePage/CacPage/Perak/body.dart';

class Perak extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('CAC - Perak')),
      body: Body(),
    );
  }
}
