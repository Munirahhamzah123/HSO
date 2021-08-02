import 'package:flutter/material.dart';
import 'package:fyp/src/Screens/HomePage/HomeScreen/page1.dart';
import 'package:fyp/src/Screens/HomePage/Statistics/page3.dart';
import 'package:fyp/src/Screens/HomePage/page4.dart';
import 'package:fyp/src/Screens/Profile/newprofile.dart';
import 'package:fyp/src/Screens/profile.dart';

class TestingScreen extends StatefulWidget {
  @override
  _TestingScreenState createState() => _TestingScreenState();
}

class _TestingScreenState extends State<TestingScreen> {
  int _currentIndex = 0;
  Widget callPage(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return PageOne(); //Home or statistics page
      case 1:
        return PageFour(); // notification
      case 2:
        return PageThree(); //statistics

      //case 3:
      //return PageFour();

      case 3:
        return ProfileScreen(); //profile
        break;

      default:
        return PageOne();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: callPage(_currentIndex),
      bottomNavigationBar: Container(
        /*decoration: BoxDecoration(
          color: Colors.pink,
          boxShadow: [
          BoxShadow(blurRadius: 15, color: Colors.green, spreadRadius: 1)
        ]
        ),*/
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (value) {
            _currentIndex = value;
            setState(() {});
          },
          selectedItemColor: Colors.cyan.shade900,
          unselectedItemColor:
              Colors.grey.shade700, // this will be set when a new tab is tapped
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),

              // ignore: deprecated_member_use
              title: Text(
                'Home',
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.mail,
              ),
              // ignore: deprecated_member_use
              title: Text(
                'Annoucement',
              ),
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.insert_chart,
                ),
                // ignore: deprecated_member_use
                title: Text(
                  'Statistics',
                )),
            /*BottomNavigationBarItem(
                icon: Icon(Icons.mail),
                // ignore: deprecated_member_use
                title: Text(
                  'Notifications',
                )),*/
            BottomNavigationBarItem(
                // ignore: deprecated_member_use
                icon: Icon(
                  Icons.person,
                ),

                // ignore: deprecated_member_use
                title: Text(
                  'Profile',
                )),
          ],
        ),
      ),
    );
  }
}
