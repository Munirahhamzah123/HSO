import 'package:flutter/material.dart';
import 'package:fyp/AdminPage/logout.dart';
import 'package:fyp/AdminPage/pageoneadmin.dart';
import 'package:fyp/src/Screens/HomePage/HomeScreen/page1.dart';
import 'package:fyp/src/Screens/HomePage/Statistics/page3.dart';

class AdminHomePage extends StatefulWidget {
  @override
  _AdminHomePageState createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  int _currentIndex = 0;
  Widget callPage(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return AdminPageOne(); //Home or statistics page
      // notification
      case 1:
        return PageThree(); //statistics

      case 2:
        return LogoutAdmin(); //profile
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
                  Icons.insert_chart,
                ),
                // ignore: deprecated_member_use
                title: Text(
                  'Statistics',
                )),
            BottomNavigationBarItem(
                // ignore: deprecated_member_use
                icon: Icon(
                  Icons.person,
                ),

                // ignore: deprecated_member_use
                title: Text(
                  'Log out',
                )),
          ],
        ),
      ),
      /* appBar: AppBar(
        title: Text('Admin Home'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            
            StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection("users").snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData && snapshot.data != null) {
                  final docs = snapshot.data.docs;
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      final user = docs[index].data();
                      return ListTile(
                        title: Text(user['name'] ?? user['email']),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            RaisedButton(
              child: Text("Log out"),
              onPressed: () {
                AuthHelper.logOut();
              },
            ),
          ],
        ),
      ),*/
    );
  }
}
