import 'package:flutter/material.dart';
import 'package:fyp/src/Screens/HomePage/CacPage/Penang/body.dart';

class Penang extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('CAC - Penang')),
      body: Body(),
    );
  }
}
