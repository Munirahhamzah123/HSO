import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fyp/src/Screens/CovidTracker/info.dart';
import 'package:fyp/src/Screens/Distribution/distribution.dart';
import 'package:fyp/src/Screens/Forms/Contact/contacts.dart';
import 'package:fyp/src/Screens/Forms/SwabTest/swabtest.dart';
import 'package:fyp/src/Screens/Forms/Symptoms/dailychecklist.dart';
import 'package:fyp/src/Screens/Forms/Vaccine/vaccine.dart';
import 'package:fyp/src/Screens/HomePage/HomeScreen/symptoms_card.dart';
import 'package:fyp/src/Screens/HomePage/HomeScreen/tagline_card.dart';
import 'package:fyp/src/Screens/HomePage/ScreenCAC/screenCac.dart';
import 'package:fyp/src/Screens/Location/location.dart';
import 'package:fyp/src/Screens/Profile/profilescreen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          TaglineCard(),
          SizedBox(height: 10),
          //Hotline
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start, //start the word
                      children: [
                        Text(
                          "Covid-19 Assessment Centre ",
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              color: Colors.green.shade900,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ],
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ScreenCac()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.teal.shade900,
                            borderRadius: BorderRadius.circular(15)),
                        padding: EdgeInsets.all(8),
                        child: Text(
                          'Hotline',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

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
                    padding:
                        EdgeInsets.only(left: 8, right: 8, top: 5, bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: [
                            Material(
                              borderRadius: BorderRadius.circular(100.0),
                              color: Colors.green.shade900.withOpacity(0.1),
                              child: IconButton(
                                padding: EdgeInsets.all(15),
                                icon: FaIcon(FontAwesomeIcons.listUl),
                                color: Colors.green.shade900,
                                iconSize: 35.0,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Checklist()));
                                },
                              ),
                            ),
                            SizedBox(height: 8.0),
                            DashText(title: 'CHECKLIST')
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Material(
                              borderRadius: BorderRadius.circular(100.0),
                              color: Colors.green.shade900.withOpacity(0.1),
                              child: IconButton(
                                padding: EdgeInsets.all(15),
                                icon: FaIcon(FontAwesomeIcons.syringe),
                                color: Colors.green.shade900,
                                iconSize: 35.0,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Vaccine()));
                                },
                              ),
                            ),
                            SizedBox(height: 5),
                            DashText(title: 'VACCINE')
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Material(
                              borderRadius: BorderRadius.circular(100.0),
                              color: Colors.green.shade900.withOpacity(0.1),
                              child: IconButton(
                                padding: EdgeInsets.all(15.0),
                                icon: FaIcon(FontAwesomeIcons.file),
                                color: Colors.green.shade900,
                                iconSize: 35.0,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ProfileScreen()));
                                },
                              ),
                            ),
                            SizedBox(height: 5),
                            DashText(title: 'FORM')
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Material(
                              borderRadius: BorderRadius.circular(100.0),
                              color: Colors.green.shade900.withOpacity(0.1),
                              child: IconButton(
                                padding: EdgeInsets.all(15.0),
                                icon: FaIcon(FontAwesomeIcons.streetView),
                                color: Colors.green.shade900,
                                iconSize: 35.0,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              LocationScreen()));
                                },
                              ),
                            ),
                            SizedBox(height: 5),
                            DashText(title: 'LOCATION')
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
                                          builder: (context) => Swabtest()));
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
                                icon: FaIcon(FontAwesomeIcons.utensils),
                                color: Colors.green.shade900,
                                iconSize: 35.0,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ServiceScreen()));
                                },
                              ),
                            ),
                            SizedBox(height: 5),
                            DashText(title: 'FOOD/MEDICINE')
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Material(
                              borderRadius: BorderRadius.circular(100.0),
                              color: Colors.green.shade900.withOpacity(0.1),
                              child: IconButton(
                                padding: EdgeInsets.all(15.0),
                                icon: FaIcon(FontAwesomeIcons.addressCard),
                                color: Colors.green.shade900,
                                iconSize: 40.0,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Contacts()));
                                },
                              ),
                            ),
                            SizedBox(height: 5),
                            DashText(title: 'PHONE NO')
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 20),
          symptomsCard(context),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Text(
                  'Preventions',
                  style: Theme.of(context).textTheme.headline6.copyWith(
                        color: Colors.green.shade900,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 110,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    children: <Widget>[
                      prevention(
                          image: "assets/images/hand.png", title: "Wash Hands"),
                      prevention(
                          image: "assets/images/face.png",
                          title: "Avoid Touching \n\t\t\t\t\t\t\t\t\tFace"),
                      prevention(
                          image: "assets/images/mask.png", title: "Wear Mask"),
                      prevention(
                          image: "assets/images/handshake.png",
                          title: "\t\t\t\t\tAvoid \nHandshakes"),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 20),
          InfoPanel(),
          SizedBox(height: 20),

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

  //Preventions
  Widget prevention({image, title}) {
    return Container(
      child: Container(
        width: 210,
        margin: EdgeInsets.only(right: 10),
        child: Card(
          elevation: 10,
          child: Padding(
            padding: EdgeInsets.only(top: 3),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    image,
                    scale: 1.25,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(title,
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

//Symptoms
  Padding symptomsCard(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Symptoms',
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.headline6.copyWith(
                    color: Colors.green.shade900, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 15),
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 4),
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 6,
                      spreadRadius: 1)
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Symptoms(
                  title: "Headache",
                  image: 'assets/images/headache.png',
                ),
                Symptoms(
                  title: "Cough",
                  image: 'assets/images/cough.png',
                ),
                Symptoms(
                  title: "Fever",
                  image: 'assets/images/fever.png',
                ),
                Symptoms(
                  title: "Sore Throat",
                  image: 'assets/images/sorethroat.png',
                ),
              ],
            ),
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
