import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          alignment: Alignment.center,
          image: AssetImage(
            'assets/images/cacsabah.jpg',
          ),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
