import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fyp/ServicesHelper/sharedpref_helper.dart';
import 'package:fyp/constants.dart';
import 'package:fyp/src/Screens/Forms/Symptoms/days.dart';
import 'package:fyp/src/Screens/Forms/Symptoms/showchecklist.dart';
import 'package:fyp/src/Screens/Profile/waveclipper.dart';
import 'package:fyp/src/Screens/testing.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

class Checklist extends StatefulWidget {
  @override
  _ChecklistState createState() => _ChecklistState();
}

class _ChecklistState extends State<Checklist> {
  GlobalKey<FormState> _key = new GlobalKey();
  bool _autovalidate = false;
  var dateMessage = "";

  String choose1, choose2, choose3, choose4, choose5, message, formatdate;
  int activeDay;
  List<DropdownMenuItem<String>> items = [
    new DropdownMenuItem(
      child: new Text('Yes'),
      value: 'Yes',
    ),
    new DropdownMenuItem(
      child: new Text('No'),
      value: 'No',
    ),
  ];

  String userEmail = "";
  String userUid = "";

  getMyInfoFromSharedPreferences() async {
    userEmail = await SharedPreferenceHelper().getResidentEmail();
    userUid = await SharedPreferenceHelper().getResidentId();
    setState(() {
      print(userEmail);
      print(userUid);
    });
  }

  void getTime() async {
    Response response =
        await get('http://worldtimeapi.org/api/timezone/Asia/Kuala_Lumpur');
    Map data = jsonDecode(response.body);
    //print(data);
    //get properties from data
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1, 3);
    //print(datetime);
    //print(offset);

    //create DateTime
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    print("$now");
    setState(() {
      dateMessage = "$now";
    });
  }

  void initState() {
    getTime();
    getMyInfoFromSharedPreferences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //DateTime _currentdate = new DateTime.now();
    //formatdate = new DateFormat.yMMMMd().format(_currentdate);
    return new Scaffold(
      body: new ListView(
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
                      Text("\t\t\tDAILY CHECKLIST",
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
          Container(
            padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
            child: Form(
              key: _key,
              // ignore: deprecated_member_use
              autovalidate: _autovalidate,
              child: FormUI(),
            ),
          )
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget FormUI() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Text(
            'p/s : Once you have submitted, you cannot edit or delete the details.\n',
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            RaisedButton(
              color: Colors.green.shade900,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => new ShowDataPage()));
              },
              child: Text('Daily Checklist History',
                  style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Day:",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 5, left: 5, bottom: 25),
          child: Column(
            children: [
              SizedBox(height: 10),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(days.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          activeDay = index;
                        });
                      },
                      child: Container(
                        width: (MediaQuery.of(context).size.width - 40) / 10,
                        child: Column(
                          children: [
                            SizedBox(height: 10),
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: activeDay == index
                                    ? kDaysColor
                                    : Colors.transparent,
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: activeDay == index
                                        ? kDaysColor
                                        : Colors.black.withOpacity(0.1)),
                              ),
                              child: Center(
                                child: Text(days[index]['day'],
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: activeDay == index
                                            ? Colors.white
                                            : Colors.black)),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  })),
            ],
          ),
        ),
        Row(
          children: <Widget>[
            Text(
              "1. Fever",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green.shade900,
              ),
            ),
            Spacer(),
            DropdownButtonHideUnderline(
                child: DropdownButton(
              items: items,
              hint: Text('Please Choose'),
              value: choose1,
              onChanged: (String val) {
                setState(() {
                  choose1 = val;
                });
              },
            ))
          ],
        ),
        SizedBox(height: 5),
        Row(
          children: <Widget>[
            Text(
              "2. Cough",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green.shade900,
              ),
            ),
            Spacer(),
            DropdownButtonHideUnderline(
                child: DropdownButton(
              items: items,
              hint: Text('Please Choose'),
              value: choose2,
              onChanged: (String val) {
                setState(() {
                  choose2 = val;
                });
              },
            ))
          ],
        ),
        SizedBox(height: 5),
        Row(
          children: <Widget>[
            Text(
              "3. Sore Throat",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green.shade900,
              ),
            ),
            Spacer(),
            DropdownButtonHideUnderline(
                child: DropdownButton(
              items: items,
              hint: Text('Please Choose'),
              value: choose3,
              onChanged: (String val) {
                setState(() {
                  choose3 = val;
                });
              },
            ))
          ],
        ),
        SizedBox(height: 5),
        Row(
          children: <Widget>[
            Text(
              "4. Running Nose",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green.shade900,
              ),
            ),
            Spacer(),
            DropdownButtonHideUnderline(
                child: DropdownButton(
              items: items,
              hint: Text('Please Choose'),
              value: choose4,
              onChanged: (String val) {
                setState(() {
                  choose4 = val;
                });
              },
            ))
          ],
        ),
        SizedBox(height: 5),
        Row(
          children: <Widget>[
            Text(
              "5. Shortness of Breath",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green.shade900,
              ),
            ),
            Spacer(),
            DropdownButtonHideUnderline(
                child: DropdownButton(
              items: items,
              hint: Text('Please Choose'),
              value: choose5,
              onChanged: (String val) {
                setState(() {
                  choose5 = val;
                });
              },
            ))
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: <Widget>[
            Text(
              "**Special Note:",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.green.shade900,
              ),
            ),
          ],
        ),
        SizedBox(height: 5),
        TextFormField(
          decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Special Notes',
              helperText: 'Eg: Diarrhea / Vomit '),
          maxLines: 3,
          onSaved: (val) {
            message = val;
          },
        ),
        Center(
          child: SizedBox(
            width: 200,
            height: 50,
            child: RaisedButton(
              color: Colors.green.shade800,
              onPressed: _sendToServer,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                  side: BorderSide(color: Colors.green.shade800, width: 2)),
              textColor: Colors.white,
              child: Text(
                "SUBMIT",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ),
        SizedBox(height: 20.0),
      ],
    );
  }

  _sendToServer() {
    if (_key.currentState.validate()) {
      print(userUid);
      _key.currentState.save();
      DatabaseReference ref = FirebaseDatabase.instance.reference();
      var data = {
        "choose": choose1,
        "cough": choose2,
        "sorethroat": choose3,
        "nose": choose4,
        "breath": choose5,
        "message": message,
        "date": dateMessage,
        "day": activeDay + 1,
        "user": userUid,
        "email": userEmail,
      };
      print(choose1);
      print(choose2);
      print(choose3);
      print(choose4);
      print(choose5);
      print(message);
      print(dateMessage);
      print(userUid);
      print(userEmail);

      ref.child('DailyChecklist').push().set(data).then((v) {
        _key.currentState.reset();
      });

      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => TestingScreen()));
    } else {
      setState(() {
        _autovalidate = true;
      });
    }
  }
}
