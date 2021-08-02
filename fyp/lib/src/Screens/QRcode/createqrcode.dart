import 'package:flutter/material.dart';
import 'package:fyp/src/Screens/QRcode/body.dart';

class QrScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: SizedBox(
                width: 170,
                height: 50,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                      side: BorderSide(color: Colors.green.shade300, width: 2)),
                  color: Colors.green.shade300,
                  onPressed: () {
                    print("tapped on create QR button.");
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => QRScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "Create QR",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              child: SizedBox(
                width: 170,
                height: 50,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                      side: BorderSide(color: Colors.green.shade900, width: 2)),
                  color: Colors.green.shade900,
                  onPressed: () {
                    print("tapped on scan QR button.");
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => QRScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "Scan QR",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
