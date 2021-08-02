import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/ServicesHelper/sharedpref_helper.dart';

class AddNewAppointment extends StatefulWidget {
  const AddNewAppointment({Key key}) : super(key: key);

  @override
  _AddNewAppointmentState createState() => _AddNewAppointmentState();
}

class _AddNewAppointmentState extends State<AddNewAppointment> {
  DateTime dateTime = DateTime.now();
  String userEmail = "";
  String userUid = "";
  String tempat = "";
  String date = "";

  getMyInfoFromSharedPreferences() async {
    userEmail = await SharedPreferenceHelper().getResidentEmail();
    userUid = await SharedPreferenceHelper().getResidentId();
    // print(userUid);
    setState(() {});
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
    return Container(
        //body: Container(
        child: Column(
      children: [
        SizedBox(height: 15),
        Column(
          children: [
            Center(child: buildDatePicker()),
          ],
        ),
        /* ElevatedButton(
          onPressed: () {},
          child: Text('Submit'),
        )*/
      ],
    ));
  }

  Widget buildDatePicker() => SizedBox(
        height: 70,
        child: CupertinoDatePicker(
          minimumYear: 2019,
          maximumYear: DateTime.now().year,
          initialDateTime: dateTime,
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: (dateTime) =>
              setState(() => this.dateTime = dateTime),
        ),
      );
}
