//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fyp/ServicesHelper/sharedpref_helper.dart';

class ListProfile extends StatefulWidget {
  @override
  _ListProfileState createState() => _ListProfileState();
}

class MyData {
  String name, gender, icno, phone, address, city, state, postcode, user, email;

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
  );
}

class _ListProfileState extends State<ListProfile> {
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
        );
        /*if (data[key]['user'] == userUid) {
          print('YES ADAAAAAA');
          allData.add(d);
        }*/
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
        title: new Text('Testing 1234'),
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
  ) {
    return Container(
      // elevation: 10.0,
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // ignore: deprecated_member_use
            Text('Name : $name', style: TextStyle(fontSize: 16)),

            Text('Gender : $gender', style: TextStyle(fontSize: 16)),

            Text('IC : $icno', style: TextStyle(fontSize: 16)),

            Text('Phone No : $phone', style: TextStyle(fontSize: 16)),

            Text('Address : $address', style: TextStyle(fontSize: 16)),
            Text('City : $city', style: TextStyle(fontSize: 16)),
            Text('State : $state', style: TextStyle(fontSize: 16)),
            Text('Postcode : $postcode', style: TextStyle(fontSize: 16)),
            Text('User id : $user', style: TextStyle(fontSize: 16)),
            Text('User Email : $email',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.green.shade900,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
