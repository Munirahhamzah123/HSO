import 'package:flutter/material.dart';
import 'package:fyp/AdminPage/swab1.dart';
import 'package:fyp/AdminPage/swab2.dart';

class SwabtestQRcode extends StatefulWidget {
  @override
  _SwabtestQRcodeState createState() => _SwabtestQRcodeState();
}

class _SwabtestQRcodeState extends State<SwabtestQRcode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 50),
                Center(
                  child: SizedBox(
                    width: 250,
                    height: 50,
                    child: RaisedButton(
                      color: Colors.green.shade900,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Scan1Screen()));
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                          side: BorderSide(
                              color: Colors.green.shade900, width: 2)),
                      textColor: Colors.white,
                      child: Text(
                        "1st Swab Test",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: SizedBox(
                    width: 250,
                    height: 50,
                    child: RaisedButton(
                      color: Colors.green.shade600,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Scan2Screen()));
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                          side: BorderSide(
                              color: Colors.green.shade600, width: 2)),
                      textColor: Colors.white,
                      child: Text(
                        "2nd Swab Test",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
