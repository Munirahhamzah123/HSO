import 'package:flutter/material.dart';
import 'package:fyp/src/Screens/HomePage/CacPage/Terengganu/body.dart';

class Terengganu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('CAC - Terengganu'),
      ),
      body: Body(),
    );
  }
}
