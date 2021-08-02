import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:fyp/Components/rounded_button.dart';
import 'package:fyp/ServicesHelper/sharedpref_helper.dart';
import 'package:fyp/constants.dart';
import 'package:fyp/src/Screens/reset.dart';
import 'package:fyp/src/Screens/testing.dart';
import 'package:fyp/src/Screens/verify.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email, _password;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 250,
                child: RotatedBox(
                  quarterTurns: 2,
                  child: WaveWidget(
                    config: CustomConfig(
                      gradients: [
                        [Colors.cyan[900], Colors.green[500]],
                        [Colors.teal, Colors.green.shade900],
                        [Colors.green.shade200, Colors.green.shade200],
                        [Colors.green, Colors.cyan[800]]
                      ],
                      durations: [35000, 19440, 10800, 6000],
                      heightPercentages: [0.25, 0.26, 0.28, 0.31],
                      blur: MaskFilter.blur(BlurStyle.solid, 10),
                      gradientBegin: Alignment.topLeft,
                      gradientEnd: Alignment.bottomRight,
                    ),
                    waveAmplitude: 0,
                    size: Size(
                      double.infinity,
                      double.infinity,
                    ),
                  ),
                ),
              ),
              //SizedBox(height: 100),
              /*Image.asset(
                'assets/images/welcome.PNG',
                height: 150,
                width: 200,
              ),*/
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.black),
                    hintText: 'enter your email',
                  ),
                  onChanged: (value) {
                    setState(() {
                      _email = value.trim();
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.black),
                    hintText: 'enter your password',
                  ),
                  onChanged: (value) {
                    setState(() {
                      _password = value.trim();
                    });
                  },
                ),
              ),
              SizedBox(height: size.height * 0.03),
              RoundedButton(
                  textColor: Colors.white,
                  color: kPrimaryColor, //button color
                  text: "SIGN IN",
                  press: () => _signin(_email, _password)),
              RoundedButton(
                  textColor: Colors.black,
                  color: kPrimaryLightColor,
                  text: "SIGN UP",
                  press: () => _signup(_email, _password)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    child: Text('Forgot Password?'),
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ResetScreen())),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _signin(String _email, String _password) async {
    try {
      //Create Get Firebase Auth User
      UserCredential result = await auth.signInWithEmailAndPassword(
          email: _email, password: _password);
      print(result.user.uid);

      if (result != null) {
        SharedPreferenceHelper().saveResidentEmail(result.user.email);
        SharedPreferenceHelper().saveResidentId(result.user.uid);
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => TestingScreen())); //TestingScreen (homepage)
      }
    } on FirebaseAuthException catch (error) {
      Fluttertoast.showToast(msg: error.message, gravity: ToastGravity.TOP);
    }
  }

  _signup(String _email, String _password) async {
    try {
      //Create Get Firebase Auth User
      await auth.createUserWithEmailAndPassword(
          email: _email, password: _password);

      //Success
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => VerifyScreen()));
    } on FirebaseAuthException catch (error) {
      Fluttertoast.showToast(
        msg: error.message,
        gravity: ToastGravity.TOP,
      );
    }
  }

  Future getCurrentUser() async {
    var _firebaseAuth;
    return await _firebaseAuth.currentUser();
  }
}
