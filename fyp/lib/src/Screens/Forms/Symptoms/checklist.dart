import 'package:flutter/material.dart';
import 'package:fyp/src/Screens/Profile/waveclipper.dart';
import 'package:fyp/src/Screens/testing.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckList extends StatefulWidget {
  @override
  _CheckListState createState() => _CheckListState();
}

class _CheckListState extends State<CheckList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClipPath(
                clipper: WaveClipper2(),
                child: Container(
                  child: Column(),
                  width: double.infinity,
                  height: 185,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Colors.green.shade100,
                    Colors.green.shade100
                  ])),
                ),
              ),
              ClipPath(
                clipper: WaveClipper3(),
                child: Container(
                  child: Column(),
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.teal, Colors.green.shade900])),
                ),
              ),
              ClipPath(
                clipper: WaveClipper1(),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 40,
                      ),
                      Text("\t\t\tSYMPTOMS CHECKLIST",
                          style: GoogleFonts.amiko(
                              textStyle: TextStyle(
                                  color: Colors.white, fontSize: 24))),
                    ],
                  ),
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.teal, Colors.green],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight)),
                ),
              ),
              Positioned(
                top: 30,
                left: 6,
                child: IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.arrow_back),
                  iconSize: 35,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TestingScreen()));
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
