import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fyp/AdminPage/annouce.dart';
import 'package:fyp/AdminPage/dailyhistory.dart';
import 'package:fyp/AdminPage/foodmedicine.dart';
import 'package:fyp/AdminPage/swabtest.dart';
import 'package:fyp/src/Screens/HomePage/HomeScreen/tagline_card.dart';

class AdminPageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          TaglineCard(),
          SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.only(right: 8, left: 8),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 4),
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 6,
                        spreadRadius: 1)
                  ]),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Material(
                              borderRadius: BorderRadius.circular(100.0),
                              color: Colors.green.shade900.withOpacity(0.1),
                              child: IconButton(
                                padding: EdgeInsets.all(15.0),
                                icon: FaIcon(FontAwesomeIcons.userCheck),
                                color: Colors.green.shade900,
                                iconSize: 35.0,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AdminChecklist()));
                                },
                              ),
                            ),
                            SizedBox(height: 5),
                            DashText(title: 'CHECKLIST')
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Material(
                              borderRadius: BorderRadius.circular(100.0),
                              color: Colors.green.shade900.withOpacity(0.1),
                              child: IconButton(
                                padding: EdgeInsets.all(15.0),
                                icon: FaIcon(FontAwesomeIcons.pills),
                                color: Colors.green.shade900,
                                iconSize: 35.0,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AdminMedicine()));
                                },
                              ),
                            ),
                            SizedBox(height: 5),
                            DashText(title: 'MEDICINE')
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Material(
                              borderRadius: BorderRadius.circular(100.0),
                              color: Colors.green.shade900.withOpacity(0.1),
                              child: IconButton(
                                padding: EdgeInsets.all(15.0),
                                icon: FaIcon(FontAwesomeIcons.vial),
                                color: Colors.green.shade900,
                                iconSize: 35.0,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SwabtestQRcode()));
                                },
                              ),
                            ),
                            SizedBox(height: 5),
                            DashText(title: 'SWABTEST')
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Material(
                              borderRadius: BorderRadius.circular(100.0),
                              color: Colors.green.shade900.withOpacity(0.1),
                              child: IconButton(
                                padding: EdgeInsets.all(15.0),
                                icon: FaIcon(FontAwesomeIcons.bell),
                                color: Colors.green.shade900,
                                iconSize: 35.0,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AdminAn()));
                                },
                              ),
                            ),
                            SizedBox(height: 5),
                            DashText(title: 'ANNOUNCEMENT')
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 40),
          Center(
            child: Text(
              '#KITAJAGAKITA',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}

class DashText extends StatelessWidget {
  const DashText({
    Key key,
    this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text('$title',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold));
  }
}
