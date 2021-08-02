import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fyp/ServicesHelper/databaseMethod.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class PopoutNoti extends StatefulWidget {
  @override
  _PopoutNotiState createState() => _PopoutNotiState();
}

class _PopoutNotiState extends State<PopoutNoti> {
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

  Stream announcementStream;

  getAnnouncementStream() async {
    announcementStream = await DatabaseMethod().getAnnouncement();
    setState(() {});
  }

  void initState() {
    getAnnouncementStream();
    getTime();
    super.initState();
  }

  // String formatdate = new DateFormat.yMMMMd().format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
        stream: announcementStream,
        builder: (BuildContext context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          } else {
            print(snapshot.data.docs.length);
            return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];
                  var announcementDate = new DateFormat.yMMMMd()
                      .format(ds["uploaded_on"].toDate());

                  //print(announcementDate);
                  return Card(
                    //color: Colors.green[100],
                    elevation: 10.0,
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(announcementDate,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          SizedBox(height: 10),
                          Text(
                            "TITLE : \t" + ds["title"],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Text(ds["body"]),
                        ],
                      ),
                    ),
                  );
                });
          }
        },
      ),
    );
  }
}
