import 'package:flutter/material.dart';
import 'package:fyp/ServicesHelper/sharedpref_helper.dart';

class NewProfile extends StatefulWidget {
  const NewProfile({Key key}) : super(key: key);

  @override
  _NewProfileState createState() => _NewProfileState();
}

class _NewProfileState extends State<NewProfile> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  final Color primary = Colors.white;
  final Color active = Colors.deepOrangeAccent.shade700;
  final Color divider = Colors.grey.shade600;

  String userEmail = "";
  String userUid = "";

  getMyInfoFromSharedPreferences() async {
    userEmail = await SharedPreferenceHelper().getResidentEmail();
    userUid = await SharedPreferenceHelper().getResidentId();
    setState(() {});
    print(userUid);
  }

  @override
  void initState() {
    // TODO: implement initState
    getMyInfoFromSharedPreferences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(userUid),
    );
  }
}
