import 'package:flutter/material.dart';
import 'package:fyp/src/Screens/HomePage/CacPage/Perlis/body.dart';

class Perlis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('CAC - Perlis')),
      body: Body(),
    );
  }
}
