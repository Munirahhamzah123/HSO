import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          scale: 1, //1-bigger 10-smaller
          alignment: Alignment.center,
          image: AssetImage(
            'assets/images/cacperak.jpg',
          ),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
