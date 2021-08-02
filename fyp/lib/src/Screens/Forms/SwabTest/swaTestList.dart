import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fyp/ServicesHelper/databaseMethod.dart';
import 'package:fyp/ServicesHelper/sharedpref_helper.dart';
import 'package:fyp/src/Screens/Forms/SwabTest/addnewappointment.dart';

class SwabTestListScreen extends StatefulWidget {
  @override
  _SwabTestListScreenState createState() => _SwabTestListScreenState();
}

class _SwabTestListScreenState extends State<SwabTestListScreen> {
  String userEmail = "";
  String userUid = "";
  Stream swabAppoinment;

  getSwabAppointmentStream() async {
    swabAppoinment = await DatabaseMethod().getSwabAppointment(userUid);

    setState(() {});
  }

  getMyInfoFromSharedPreferences() async {
    userEmail = await SharedPreferenceHelper().getResidentEmail();
    userUid = await SharedPreferenceHelper().getResidentId();
    // print(userUid);
    setState(() {});
    getSwabAppointmentStream();
  }

  @override
  void initState() {
    // TODO: implement initState
    getMyInfoFromSharedPreferences();
    // getSwabAppointmentStream();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddNewAppointment()));
        },
        child: const Icon(Icons.navigation),
        backgroundColor: Colors.green,
      ),
      body: StreamBuilder(
          stream: swabAppoinment,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print("record exist ${snapshot.data.docs.length}");
              // print(snapshot.data.docs.length);
              return ListView.builder(
                  padding: EdgeInsets.all(0.0),
                  // shrinkWrap: true,
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return Column(children: [
                      Text(ds["status"]),
                      Text(ds["userId"]),
                      // Text("Test"),
                    ]);
                  });
            } else {
              print("record dont exist");
              return Center(child: CircularProgressIndicator());
              // currentStep = 0;
              // setState(() {});
            }
          }),
    );
  }
}
