import 'package:flutter/material.dart';
import 'package:fyp/constants.dart';

class TaglineCard extends StatelessWidget {
  const TaglineCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(top: 100, bottom: 16, left: 8, right: 25),
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
          image: DecorationImage(
            scale: 1.6,
            alignment: Alignment.bottomLeft,
            image: AssetImage('assets/images/doctor.png'),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Together We Fight!',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )
          ],
        ));
  }
}
