import 'package:flutter/material.dart';
import 'package:fyp/LoginRole/signin.dart';
//import 'package:fyp/src/Screens/testing.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    var d = Duration(seconds: 3); //delayed 5 seconds to next page
    Future.delayed(d, () {
      //to next page and close this splash screen
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) {
            return LoginPage();
          },
        ),
        (route) => false,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: Image.asset('assets/images/stay.PNG'), //logo
        ),
      ),
    );
  }
}
