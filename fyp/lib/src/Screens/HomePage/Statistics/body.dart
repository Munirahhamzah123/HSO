import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fyp/src/Screens/CovidTracker/covid_tracker_screen.dart';
import 'package:fyp/src/Screens/CovidTracker/malaysiadata.dart';

import 'package:fyp/src/Screens/HomePage/Statistics/taglinecard.dart';
import 'package:http/http.dart' as http;

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Map malaysiaData;
  fetchMalaysiaData() async {
    http.Response response =
        await http.get('https://disease.sh/v3/covid-19/countries/malaysia');
    setState(() {
      malaysiaData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchMalaysiaData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          //background gradient green
          TaglineCard(),
          SizedBox(height: 10),
          overallCases(context),
          SizedBox(height: 3),

          malaysiaData == null
              ? CircularProgressIndicator()
              : MalaysiaPanel(
                  malaysiaData: malaysiaData,
                ),
          SizedBox(height: 10),

          SizedBox(height: 10),

          Center(
            child: Text(
              '#KITAMESTIMENANG',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          SizedBox(
            height: 50,
          ), //Worldwide data code
        ],
      ),
    );
  }
}

Padding overallCases(BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(16),
    child: Column(
      children: <Widget>[
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start, //start the word
              children: [
                Text(
                  "COVID-19",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(color: Colors.black),
                ),
                Text(
                  'Last Update | 18:00 GMT + 8',
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CovidScreen()));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.teal.shade900,
                    borderRadius: BorderRadius.circular(15)),
                padding: EdgeInsets.all(10),
                child: Text(
                  'Worldwide',
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
  );
}
