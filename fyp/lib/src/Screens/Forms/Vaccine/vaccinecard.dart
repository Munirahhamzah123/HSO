import 'package:flutter/material.dart';
import 'package:fyp/src/Screens/CovidTracker/datasource.dart';
import 'package:google_fonts/google_fonts.dart';

class VaccineCard extends StatelessWidget {
  const VaccineCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft, //position for quote / words
      padding: EdgeInsets.only(
          top: 40, bottom: 16, left: 8, right: 100), //position adjustment
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.green.shade100, Colors.green.shade100],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
        color: Colors.lightGreen.shade300,
        image: DecorationImage(
          scale: 3, //1-bigger 10-smaller
          alignment: Alignment.bottomRight,
          image: AssetImage(
            'assets/images/vac.png',
          ),
        ),
      ),
      child: Text(
        DataSource.vaccine,
        style: GoogleFonts.concertOne(
          color: Colors.black,
          //fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}
