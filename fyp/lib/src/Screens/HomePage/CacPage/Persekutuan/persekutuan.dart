import 'package:flutter/material.dart';
import 'package:fyp/src/Screens/HomePage/CacPage/Persekutuan/body.dart';

class Persekutuan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('CAC - WP KL & Putrajaya')),
      body: Body(),
    );
  }
}
