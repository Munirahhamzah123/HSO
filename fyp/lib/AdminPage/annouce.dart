import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fyp/AdminPage/addann.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class AdminAn extends StatefulWidget {
  const AdminAn({Key key}) : super(key: key);

  @override
  _AdminAnState createState() => _AdminAnState();
}

class _AdminAnState extends State<AdminAn> {
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
    setState(() {});
  }

  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // navigation screen baru 'addAnnouncement'
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => AddAn()));
          },
          child: const Icon(Icons.navigation),
          backgroundColor: Colors.green,
        ),
        body: Container(
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("annoucement")
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              }
              return ListView(
                children: snapshot.data.docs.map((document) {
                  // print(document["uploaded_on"]);
                  var announcementDate = new DateFormat.yMMMMd()
                      .format(document["uploaded_on"].toDate());

                  //print(announcementDate);
                  return Card(
                    elevation: 10.0,
                    child: Container(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(announcementDate,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          SizedBox(height: 10),
                          Text(
                            "TITLE : \t" + document["title"],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Text(document["body"]),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ));
  }
}
