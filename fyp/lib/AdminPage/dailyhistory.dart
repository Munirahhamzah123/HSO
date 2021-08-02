//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fyp/ServicesHelper/sharedpref_helper.dart';

class AdminChecklist extends StatefulWidget {
  @override
  _AdminChecklistState createState() => _AdminChecklistState();
}

class MyData {
  String message, choose, cough, sorethroat, nose, breath, date, user, email;
  int day;

  MyData(
    this.message,
    this.choose,
    this.cough,
    this.sorethroat,
    this.nose,
    this.breath,
    this.date,
    this.day,
    this.user,
    this.email,
  );
}

class _AdminChecklistState extends State<AdminChecklist> {
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
    ref
        .child('DailyChecklist')
        .orderByChild('day')
        .once()
        .then((DataSnapshot snap) {
      var keys = snap.value.keys;
      var data = snap.value;

      allData.clear();
      for (var key in keys) {
        MyData d = new MyData(
          data[key]['message'],
          data[key]['choose'],
          data[key]['cough'],
          data[key]['sorethroat'],
          data[key]['nose'],
          data[key]['breath'],
          data[key]['date'],
          data[key]['day'],
          data[key]['user'],
          data[key]['email'],
        );

        allData.add(d);
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
      appBar: new AppBar(
        title: new Text('Daily Checklist'),
      ),
      body: new Container(
          child: allData.length == 0
              ? Center(
                  child: new Text('No Data is Available ',
                      style: TextStyle(fontSize: 20)))
              : new ListView.builder(
                  itemCount: allData.length,
                  itemBuilder: (_, index) {
                    return index == 0
                        ? _searchBar()
                        : UI(
                            allData[index].day,
                            allData[index].date,
                            allData[index].choose,
                            allData[index].cough,
                            allData[index].sorethroat,
                            allData[index].nose,
                            allData[index].breath,
                            allData[index].message,
                            allData[index].user,
                            allData[index].email,
                          );
                  },
                )),
    );
  }

  _searchBar() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextField(
        decoration: InputDecoration(hintText: 'Search.....'),
        onChanged: (text) {
          text = text.toLowerCase();
          setState(() {
            allData = allData.where((allData) {
              var dataTitle = allData.email.toLowerCase();
              return dataTitle.contains(text);
            }).toList();
          });
        },
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget UI(
    int day,
    String date,
    String choose,
    String cough,
    String sorethroat,
    String nose,
    String breath,
    String message,
    String user,
    String email,
  ) {
    return Card(
      elevation: 10.0,
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // ignore: deprecated_member_use
            Text('Day : $day', style: TextStyle(fontSize: 16)),
            Text('Date | Time : $date', style: TextStyle(fontSize: 16)),
            Text('Fever : $choose', style: TextStyle(fontSize: 16)),
            Text('Cough : $cough', style: TextStyle(fontSize: 16)),
            Text('Sore throat : $sorethroat', style: TextStyle(fontSize: 16)),
            Text('Running Nose : $nose', style: TextStyle(fontSize: 16)),
            Text('Shortness of Breath : $breath',
                style: TextStyle(fontSize: 16)),
            Text('Message : $message',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.green.shade900,
                    fontWeight: FontWeight.bold)),
            Text('$email', style: TextStyle(fontSize: 10)),
          ],
        ),
      ),
    );
  }
}
