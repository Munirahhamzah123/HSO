import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class Scan2Screen extends StatefulWidget {
  @override
  _Scan2ScreenState createState() => _Scan2ScreenState();
}

class _Scan2ScreenState extends State<Scan2Screen> {
  double height, width;
  String qrString = "Not Scanned";
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Scan QR Code"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            qrString,
            style: TextStyle(color: Colors.pink, fontSize: 30),
          ),
          Container(
            child: SizedBox(
              width: 270,
              height: 50,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                    side: BorderSide(color: Colors.green.shade600, width: 2)),
                color: Colors.green.shade600,
                onPressed: scanQR,
                child: Text(
                  "Scan Code for 2nd Swab Test",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(width: width),
        ],
      ),
    );
  }

  Future<void> scanQR() async {
    try {
      DatabaseReference ref = FirebaseDatabase.instance.reference();
      FlutterBarcodeScanner.scanBarcode("#2A99CF", "Cancel", true, ScanMode.QR)
          .then((value) {
        setState(() {
          qrString = value;
          ref.child('ScanSwab2').push().set(qrString).then((v) {});
        });
      });
    } catch (e) {
      setState(() {
        qrString = "unable to read the qr";
      });
    }
  }
}
