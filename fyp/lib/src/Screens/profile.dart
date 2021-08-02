import 'package:flutter/material.dart';
import 'package:fyp/Components/oval.dart';
import 'package:fyp/LoginRole/signin.dart';
import 'package:fyp/ServicesHelper/databaseMethod.dart';
import 'package:fyp/ServicesHelper/sharedpref_helper.dart';
import 'Profile/body.dart';
//import 'package:fyp/src/Screens/login.dart';
//import 'package:fyp/src/Screens/reset.dart';
//import 'package:fyp/src/Screens/testing.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
  }

  getUserNameFromRealTIme() {
    // querying the displayname userUid
  }

  @override
  void initState() {
    // TODO: implement initState
    getMyInfoFromSharedPreferences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      key: _key,
      drawer: _buildDrawer(),
      body: Body(),
      /*SingleChildScrollView(
        child: Container(
          child: Stack(
            children: <Widget>[
              Container(
                height: 180,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    gradient: LinearGradient(
                        colors: [kGradientColor, kGradient2Color],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight)),
              ),
              Positioned(
                top: 30,
                left: 6,
                child: IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.menu),
                  iconSize: 35,
                  onPressed: () {
                    _key.currentState.openDrawer();
                  },
                ),
              ),
            ],
          ),
        ),
      ),*/
    );
  }

  _buildDrawer() {
    return ClipPath(
      clipper: OvalRightBorderClipper(),
      child: Drawer(
        child: Container(
          padding: const EdgeInsets.only(left: 16.0, right: 40),
          decoration: BoxDecoration(
              color: primary, boxShadow: [BoxShadow(color: Colors.black45)]),
          width: 300,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 100),
                  Container(
                    height: 90,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            colors: [Colors.teal.shade900, Colors.green[200]])),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.green[50],
                      // backgroundImage: NetworkImage(userAvatarUrl),
                    ),
                  ),
                  SizedBox(height: 15),
                  /*Text(
                    userUid,
                    style: TextStyle(color: Colors.black, fontSize: 20.0),
                  ),*/
                  Text(
                    userEmail,
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(height: 30.0),
                  /*_buildRow(Icons.person_pin, "Your profile", () {}),
                  _buildDivider(),
                  _buildRow(Icons.settings, "Settings", () {}),
                  _buildDivider(),
                  _buildRow(Icons.email, "Contact us", () {}),
                  _buildDivider(),
                  _buildRow(Icons.info_outline, "Help", () {}),*/
                  _buildDivider(),
                  _buildRow(Icons.exit_to_app_outlined, "Logout", () {
                    print("Logout pressed");
                    print(userUid);
                    print(userEmail);
                    DatabaseMethod().signOut().then((s) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    });
                  }),
                  _buildDivider(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Divider _buildDivider() {
    return Divider(
      color: Colors.grey.shade900,
    );
  }

  Widget _buildRow(IconData icon, String title, Function press) {
    final TextStyle tStyle = TextStyle(color: active, fontSize: 16.0);
    return InkWell(
      onTap: press,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(children: [
          Icon(
            icon,
            color: active,
          ),
          SizedBox(width: 10.0),
          Text(
            title,
            style: tStyle,
          ),
        ]),
      ),
    );
  }
}
