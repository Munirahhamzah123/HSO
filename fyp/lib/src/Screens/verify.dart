import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp/ServicesHelper/sharedpref_helper.dart';
import 'package:fyp/src/Screens/splashscreen.dart';

class VerifyScreen extends StatefulWidget {
  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final auth = FirebaseAuth.instance;
  User user;
  Timer timer;

  String userEmail = "";
  String userUid = "";

  getMyInfoFromSharedPreferences() async {
    userEmail = await SharedPreferenceHelper().getResidentEmail();
    userUid = await SharedPreferenceHelper().getResidentId();
    setState(() {
      print(userEmail);
      print(userUid);
    });
  }

  @override
  void initState() {
    user = auth.currentUser;
    user.sendEmailVerification();

    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      checkEmailVerified();
    });
    getMyInfoFromSharedPreferences();
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify Email'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
              '\t\tAn email has been sent to\n${user.email} \n\t\t\t\t\t\t    please verify'),
          /* RoundedButton(
            text: "HOME",
            color: kPrimaryColor,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginPage();
                  },
                ),
              );
            },
          ),*/
        ],
      )),
    );
  }

  Future<void> checkEmailVerified() async {
    user = auth.currentUser;
    await user.reload();
    if (user.emailVerified) {
      timer.cancel();
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => SplashScreen())); //HomeScreen //ProfileScreen
    }
  }
}
