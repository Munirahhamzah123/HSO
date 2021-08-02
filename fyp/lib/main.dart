import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fyp/LoginRole/adminhome.dart';
import 'package:fyp/LoginRole/auth_helper.dart';
import 'package:fyp/LoginRole/signin.dart';
import 'package:fyp/src/Screens/testing.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(App());
}

class App extends StatelessWidget {
  final FirebaseMessaging _messaging = FirebaseMessaging();

  void initState() {
    _messaging.getToken().then((token) {
      print(token);
      print("hello");
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'House Surveillance Order',
      theme: new ThemeData(
        primaryColor: Colors.green.shade200,
      ),
      debugShowCheckedModeBanner: false,
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final FirebaseMessaging _messaging = FirebaseMessaging();

  @override
  void initState() {
    super.initState();

    _messaging.getToken().then((token) {
      print(token);
      print("hello");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'House Surveillance Order',
      theme: ThemeData(
        primaryColor: Colors.green.shade200,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          elevation: 0,
          brightness: Brightness.light,
          iconTheme: IconThemeData(color: Colors.black),
          textTheme: TextTheme(
            headline6: TextStyle(
              //fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ),
      ),
      home: StreamBuilder<User>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              UserHelper.saveUser(snapshot.data);
              return StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("users")
                    .doc(snapshot.data.uid)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.hasData && snapshot.data != null) {
                    final userDoc = snapshot.data;
                    final user = userDoc.data();
                    if (user['role'] == 'admin') {
                      return AdminHomePage();
                    } else {
                      return TestingScreen();
                    }
                  } else {
                    return Material(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                },
              );
            }
            return LoginPage();
          }),
    );
  }
//EDIT START HERE
/*

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'House Surveillance Order',
      theme: ThemeData(
        primaryColor: Colors.green.shade200,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          elevation: 0,
          brightness: Brightness.light,
          iconTheme: IconThemeData(color: Colors.black),
          textTheme: TextTheme(
            headline6: TextStyle(
              //fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ),
      ),
      home:
          /*FutureBuilder(
        future: DatabaseMethod().getCurrentUser(),
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return TestingScreen();
          } else {
            return LoginScreen();
          }
        },
      ),*/
      
      //TestingScreen(),

      //SplashScreen - start the apps
      //LoginScreen -login
      //TestingScreen - Main Page / edit & set pages
      //HomeScreen - for Logout
      //ProfileDataScreen - test for retrieving profile data
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }*/
}

/*import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fyp/ServicesHelper/auth.dart';
import 'package:fyp/ServicesHelper/databaseMethod.dart';
import 'package:fyp/src/Screens/login.dart';
import 'package:fyp/src/Screens/testing.dart';

//import 'package:fyp/src/Screens/testing.dart';
//import 'package:fyp/src/Screens/testing.dart';

//import 'package:fyp/src/Screens/splashscreen.dart';
//import 'package:fyp/src/Screens/Forms/Pdf/pdf.dart';

//import 'package:fyp/src/Screens/login.dart';
//import 'package:fyp/src/Screens/testing.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(App());
}


class App extends StatelessWidget {

    

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'House Surveillance Order',
      theme: ThemeData(
        primaryColor: Colors.green.shade200,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          elevation: 0,
          brightness: Brightness.light,
          iconTheme: IconThemeData(color: Colors.black),
          textTheme: TextTheme(
            headline6: TextStyle(
              //fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ),
      ),
      home: FutureBuilder(
        future: DatabaseMethod().getCurrentUser(),
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return TestingScreen();
          } else {
            return LoginScreen();
          }
        },
      ),

      // LoginScreen(),

      //SplashScreen - start the apps
      //LoginScreen -login
      //TestingScreen - Main Page / edit & set pages
      //HomeScreen - for Logout
      //ProfileDataScreen - test for retrieving profile data
    );
  }
}
*/
