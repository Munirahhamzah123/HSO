//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fyp/ServicesHelper/sharedpref_helper.dart';

//
class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class MyData {
  String name,
      gender,
      icno,
      phone,
      address,
      city,
      state,
      postcode,
      user,
      email,
      category;

  MyData(
    this.name,
    this.gender,
    this.icno,
    this.phone,
    this.address,
    this.city,
    this.state,
    this.postcode,
    this.user,
    this.email,
    this.category,
  );
}

class _BodyState extends State<Body> {
  String userUid = "";
  List<MyData> allData = [];
  getMyInfoFromSharedPreferences() async {
    userUid = await SharedPreferenceHelper().getResidentId();
    setState(() {
      print(userUid);
    });
  }

  @override
  // ignore: must_call_super
  void initState() {
    DatabaseReference ref = FirebaseDatabase.instance.reference();
    ref.child('Profile').orderByChild('name').once().then((DataSnapshot snap) {
      var keys = snap.value.keys;
      var data = snap.value;

      allData.clear();
      for (var key in keys) {
        MyData d = new MyData(
          data[key]['name'],
          data[key]['gender'],
          data[key]['icno'],
          data[key]['phone'],
          data[key]['address'],
          data[key]['city'],
          data[key]['state'],
          data[key]['postcode'],
          data[key]['user'],
          data[key]['email'],
          data[key]['category'],
        );
        if (data[key]['user'] == userUid) {
          print('YES ADAAAAAA');
          allData.add(d);
        }
        //allData.add(d);
      }
      setState(() {
        print('Length : ${allData.length}');
      });
    });
    getMyInfoFromSharedPreferences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: new AppBar(),
      body: new Container(
          child: allData.length == 0
              ? Center(
                  child: new Text('No Data is Available ',
                      style: TextStyle(fontSize: 20)))
              : new ListView.builder(
                  itemCount: allData.length,
                  itemBuilder: (_, index) {
                    return UI(
                      allData[index].name,
                      allData[index].gender,
                      allData[index].icno,
                      allData[index].phone,
                      allData[index].address,
                      allData[index].city,
                      allData[index].state,
                      allData[index].postcode,
                      allData[index].user,
                      allData[index].email,
                      allData[index].category,
                    );
                  },
                )),
    );
  }

  // ignore: non_constant_identifier_names
  Widget UI(
    String name,
    String gender,
    String icno,
    String phone,
    String address,
    String city,
    String state,
    String postcode,
    String user,
    String email,
    String category,
  ) {
    return Container(
      // elevation: 10.0,
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // ignore: deprecated_member_use
              Container(
                child: Row(
                  children: [
                    Text(
                      '$category',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                child: Row(
                  children: [
                    Text(
                      '$name',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[900]),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.envelope,
                      size: 24,
                      color: Colors.teal[900],
                    ),
                    SizedBox(width: 10),
                    Text(
                      '$email',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.idCard,
                      size: 24,
                      color: Colors.teal[900],
                    ),
                    SizedBox(width: 10),
                    Text(
                      '$icno',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10),
              Container(
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.mobileAlt,
                      size: 24,
                      color: Colors.teal[900],
                    ),
                    SizedBox(width: 10),
                    Text(
                      '$phone',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 15),
              Container(
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.home,
                      size: 24,
                      color: Colors.teal[900],
                    ),
                    SizedBox(width: 10),
                    Text(
                      '$address',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.building,
                      size: 24,
                      color: Colors.teal[900],
                    ),
                    SizedBox(width: 10),
                    Text(
                      '$city',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Container(
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.mapMarker,
                      size: 24,
                      color: Colors.teal[900],
                    ),
                    SizedBox(width: 10),
                    Text(
                      '$postcode',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.flag,
                      size: 24,
                      color: Colors.teal[900],
                    ),
                    SizedBox(width: 10),
                    Text(
                      '$state',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }
}
