import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fyp/ServicesHelper/sharedpref_helper.dart';
import 'package:fyp/src/Screens/Distribution/Medicine/listorder.dart';
import 'package:fyp/src/Screens/Distribution/distribution.dart';
import 'package:fyp/src/Screens/Profile/waveclipper.dart';
import 'package:fyp/src/Screens/testing.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

class CreateOrder extends StatefulWidget {
  @override
  _CreateOrderState createState() => _CreateOrderState();
}

class _CreateOrderState extends State<CreateOrder> {
  GlobalKey<FormState> _key = new GlobalKey();
  bool _autovalidate = false;
  var dateMessage = "";

  String message1, message, formatdate;

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
                      Text("\t\t\tMEDICINE",
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
            'p/s : Once you have submitted the order, you cannot edit or delete the details.',
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            RaisedButton(
              color: Colors.green.shade900,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new ListOrder()));
              },
              child: Text('Order History',
                  style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ],
        ),
        SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextFormField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Medicine',
                prefixIcon: Icon(
                  Icons.medical_services,
                  size: 30,
                ),
                helperText: 'Eg: Pil '),
            validator: validateMedicine,
            onSaved: (val) {
              message1 = val;
            },
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextFormField(
            decoration: const InputDecoration(
                prefixIcon: Icon(
                  FontAwesomeIcons.edit,
                  size: 20,
                ),
                border: OutlineInputBorder(),
                labelText: 'Description',
                helperText: 'Eg: For Diarrhea / Vomit '),
            maxLines: 3,
            validator: validateDesc,
            onSaved: (val) {
              message = val;
            },
          ),
        ),
        SizedBox(height: 20),
        Center(
          child: SizedBox(
            width: 200,
            height: 50,
            child: RaisedButton(
              color: Colors.green.shade300,
              onPressed: _sendToServer,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                  side: BorderSide(color: Colors.green.shade300, width: 2)),
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
        "message1": message1,
        "message": message,
        "date": dateMessage,
        "user": userUid,
        'email': userEmail,
      };

      ref.child('Medicine').push().set(data).then((v) {
        _key.currentState.reset();
      });

      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => ServiceScreen()));
    } else {
      setState(() {
        _autovalidate = true;
      });
    }
  }
}

String validateMedicine(String val) {
  return val.length == 0 ? "Please Enter Medicine Name / Type" : null;
}

String validateDesc(String val) {
  return val.length == 0 ? "Please Enter Cause of Pain / Ailment" : null;
}
