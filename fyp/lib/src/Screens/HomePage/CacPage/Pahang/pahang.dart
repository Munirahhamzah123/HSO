import 'package:flutter/material.dart';
import 'package:fyp/src/Screens/HomePage/CacPage/Pahang/body.dart';

class Pahang extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('CAC - Pahang')),
      body: Body(),
    );
  }
}
