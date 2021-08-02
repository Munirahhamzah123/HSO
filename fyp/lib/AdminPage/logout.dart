import 'package:flutter/material.dart';
import 'package:fyp/LoginRole/auth_helper.dart';

class LogoutAdmin extends StatelessWidget {
  const LogoutAdmin({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 100, right: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 300),
                RaisedButton(
                  color: Colors.cyan[900],
                  child: Center(
                    child: Container(
                        child: Text(
                      "LOG OUT",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )),
                  ),
                  onPressed: () {
                    AuthHelper.logOut();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
