import 'package:flutter/material.dart';
import 'package:fyp/src/Screens/HomePage/CacPage/Kelantan/body.dart';

class Kelantan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('CAC - Kelantan')),
      body: Body(),
    );
  }
}
