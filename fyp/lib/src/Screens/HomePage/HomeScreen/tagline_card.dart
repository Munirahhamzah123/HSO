import 'package:flutter/material.dart';
import 'package:fyp/constants.dart';
import 'package:fyp/src/Screens/CovidTracker/datasource.dart';
import 'package:google_fonts/google_fonts.dart';

class TaglineCard extends StatelessWidget {
  const TaglineCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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

        image: DecorationImage(
          scale: 5, //1-bigger 10-smaller
          alignment: Alignment.bottomRight,
          image: AssetImage(
            'assets/images/doctor1.png',
          ),
        ),
      ),
      child: Text(
        DataSource.quote,
        style: GoogleFonts.anaheim(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }
}
