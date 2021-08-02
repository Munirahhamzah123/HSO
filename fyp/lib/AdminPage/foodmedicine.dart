//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fyp/ServicesHelper/sharedpref_helper.dart';

class AdminMedicine extends StatefulWidget {
  @override
  _AdminMedicineState createState() => _AdminMedicineState();
}

class MyData {
  String message, message1, user, email, date;

  MyData(
    this.message,
    this.message1,
    this.user,
    this.email,
    this.date,
  );
}

class _AdminMedicineState extends State<AdminMedicine> {
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
    ref.child('Medicine').orderByChild('date').once().then((DataSnapshot snap) {
      var keys = snap.value.keys;
      var data = snap.value;

      allData.clear();
      for (var key in keys) {
        MyData d = new MyData(
          data[key]['message'],
          data[key]['message1'],
          data[key]['user'],
          data[key]['email'],
          data[key]['date'],
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
        title: new Text('MEDICINE ORDER'),
        centerTitle: true,
      ),
      body: new Container(
          child: allData.length == 0
              ? Center(
                  child: new Text('No Data is Available ',
                      style: TextStyle(fontSize: 20)))
              : new ListView.builder(
                  itemCount: allData.length,
                  itemBuilder: (_, index) {
                    return UI(
                      allData[index].message1,
                      allData[index].user,
                      allData[index].email,
                      allData[index].message,
                      allData[index].date,
                    );
                  },
                )),
    );
  }

  // ignore: non_constant_identifier_names
  Widget UI(
      String message1, String user, String email, String message, String date) {
    return Card(
      elevation: 10.0,
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // ignore: deprecated_member_use

            Text('Date | Time: $date',
                style: TextStyle(fontSize: 12, color: Colors.green.shade900)),
            Row(
              children: [
                Text('Medicine : ',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text('$message1',
                    style: TextStyle(
                      fontSize: 16,
                    )),
              ],
            ),
            SizedBox(height: 2),
            Row(
              children: [
                Text('Description : ',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text('$message',
                    style: TextStyle(
                      fontSize: 16,
                    )),
              ],
            ),
            SizedBox(height: 2),
            Text('$email', style: TextStyle(fontSize: 10)),
          ],
        ),
      ),
    );
  }
}
