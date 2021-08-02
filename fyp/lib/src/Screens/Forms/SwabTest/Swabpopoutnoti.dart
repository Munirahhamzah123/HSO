import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fyp/ServicesHelper/databaseMethod.dart';
import 'package:fyp/ServicesHelper/sharedpref_helper.dart';
import 'package:http/http.dart';

class SwabPopoutNoti extends StatefulWidget {
  @override
  _SwabPopoutNotiState createState() => _SwabPopoutNotiState();
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

class _SwabPopoutNotiState extends State<SwabPopoutNoti> {
  String userUid = "";
  Stream menuStream;
  List<MyData> allData = [];

  void getTime() async {
    Response response =
        await get('http://worldtimeapi.org/api/timezone/Asia/Kuala_Lumpur');
    Map data = jsonDecode(response.body);
    print(data);
    //get properties from data
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1, 3);
    //print(datetime);
    //print(offset);

    //create DateTime
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    print("$now");
    setState(() {});
  }

  getMenuStream() async {
    menuStream = await DatabaseMethod().getMenu();
    setState(() {});
  }

  getUserDetails() {
    DatabaseReference ref =
        FirebaseDatabase.instance.reference().child("Profile");
    // .orderByChild("city")
    // .equalTo("Gelugor");
    return (FutureBuilder(
        future: ref.once(),
        builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
          if (snapshot.hasData) {
            var keys = snapshot.data.value.keys;
            var data = snapshot.data.value;

            for (var key in keys) {
              if (data[key]['user'] == userUid) {
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Name: " + data[key]["name"]),
                      Text("IC Number: " + data[key]["icno"]),
                    ],
                  ),
                );
              }
            }
          }
          return CircularProgressIndicator();
        }));
  }

  getNewUserDetails() {
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
  }

  getMyInfoFromSharedPreferences() async {
    userUid = await SharedPreferenceHelper().getResidentId();
    setState(() {
      print(userUid);
    });
  }

  testfunction() {
    DatabaseReference ref = FirebaseDatabase.instance.reference();
    var ds = ref.child("Profile").equalTo(userUid).once();
    print("test fx here");
    print(ds);
  }

  void initState() {
    getMenuStream();
    getTime();
    getMyInfoFromSharedPreferences();
    // getUserDetails();
    // testfunction();
    // getNewUserDetails();
    super.initState();
  }

  // String formatdate = new DateFormat.yMMMMd().format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Container(
      child: getUserDetails(),

      // StreamBuilder(
      //   stream: menuStream,
      //   builder: (BuildContext context, snapshot) {
      //     if (!snapshot.hasData) {
      //       return CircularProgressIndicator();
      //     } else {
      //       print(snapshot.data.docs.length);
      //       return ListView.builder(
      //           shrinkWrap: true,
      //           itemCount: snapshot.data.docs.length,
      //           itemBuilder: (context, index) {
      //             DocumentSnapshot ds = snapshot.data.docs[index];
      //             var menuDate =
      //                 new DateFormat.yMMMMd().format(ds["date"].toDate());

      //             print(ds["date"]);

      //             //print(announcementDate);
      //             return Card(
      //               //color: Colors.green[100],
      //               elevation: 10.0,
      //               child: Container(
      //                 padding: EdgeInsets.all(10.0),
      //                 child: Column(
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: <Widget>[
      //                     /* Text("Today's Menu",
      //                         style: TextStyle(
      //                             fontWeight: FontWeight.bold, fontSize: 16)),
      //                     Text(menuDate,
      //                         style: TextStyle(
      //                             fontWeight: FontWeight.bold, fontSize: 14)),
      //                     SizedBox(height: 5),
      //                     Text(
      //                       "Menu : ",
      //                       style: TextStyle(fontWeight: FontWeight.bold),
      //                     ),
      //                     SizedBox(height: 5),
      //                     Text(
      //                       ds["food"],
      //                     ),
      //                     Text(ds["drink"]),
      //                     Text(ds["fruit"]),*/
      //                   ],
      //                 ),
      //               ),
      //             );
      //           });
      //     }
      //   },
      // ),
    );
  }
}
