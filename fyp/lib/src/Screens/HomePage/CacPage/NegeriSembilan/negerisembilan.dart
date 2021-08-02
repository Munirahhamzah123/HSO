import 'package:flutter/material.dart';
import 'package:fyp/src/Screens/HomePage/CacPage/NegeriSembilan/body.dart';

class NegeriSembilan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('CAC - Negeri Sembilan')),
      body: Body(),
    );
  }
}
