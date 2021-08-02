import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyp/LoginRole/userhome.dart';
import 'package:fyp/ServicesHelper/sharedpref_helper.dart';
import 'package:fyp/constants.dart';
import 'package:fyp/src/Screens/reset.dart';
import 'package:fyp/src/Screens/verify.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email, _password;
  final auth = FirebaseAuth.instance;
  TextEditingController _emailController;
  TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: "");
    _passwordController = TextEditingController(text: "");
  }

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
              //SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  controller: _emailController,
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
              const SizedBox(height: 10.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  controller: _passwordController,
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
              const SizedBox(height: 10.0),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                width: size.width * 0.6,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(29),
                  child: FlatButton(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                    color: kPrimaryColor,
                    onPressed: () async {
                      if (_emailController.text.isEmpty ||
                          _passwordController.text.isEmpty) {
                        print("Email and password cannot be empty");
                        return;
                      }
                      try {
                        //Create Get Firebase Auth User
                        UserCredential result =
                            await auth.signInWithEmailAndPassword(
                                email: _email, password: _password);
                        print(result.user.uid);
                        print("login successful");

                        if (result != null) {
                          SharedPreferenceHelper()
                              .saveResidentEmail(result.user.email);
                          SharedPreferenceHelper()
                              .saveResidentId(result.user.uid);
                        }
                        //Success
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => HomePage()));
                      } on FirebaseAuthException catch (error) {
                        Fluttertoast.showToast(
                            msg: error.message, gravity: ToastGravity.TOP);
                      }
                    },
                    child: Text('SIGN IN',
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                width: size.width * 0.6,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(29),
                  child: FlatButton(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                    color: Colors.green.shade100,
                    onPressed: () async {
                      if (_emailController.text.isEmpty ||
                          _passwordController.text.isEmpty) {
                        print("Email and password cannot be empty");
                        return;
                      }

                      try {
                        await auth.createUserWithEmailAndPassword(
                            email: _email, password: _password);

                        //Success
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => VerifyScreen()));
                      } on FirebaseAuthException catch (error) {
                        Fluttertoast.showToast(
                          msg: error.message,
                          gravity: ToastGravity.TOP,
                        );
                      }
                    },
                    child: Text('SIGN UP',
                        style: TextStyle(color: Colors.black, fontSize: 18)),
                  ),
                ),
              ),
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

  Future getCurrentUser() async {
    var _firebaseAuth;
    return await _firebaseAuth.currentUser();
  }
}
