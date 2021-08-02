import 'package:flutter/material.dart';
import 'package:fyp/constants.dart';

class NotiCard extends StatelessWidget {
  const NotiCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.topLeft, //position for quote / words
        padding: EdgeInsets.only(
            top: 50, bottom: 16, left: 8, right: 100), //position adjustment
        height: 180,
        width: double.infinity,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          //color: Colors.green.shade200,
          gradient: LinearGradient(
              colors: [kGradientColor, kGradient2Color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 100,
              bottom: 10,
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  child: Image.asset(
                    "assets/images/virus.png",
                    scale: 8,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              child: Container(
                width: 100,
                child: Image.asset(
                  "assets/images/person.png",
                  scale: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
