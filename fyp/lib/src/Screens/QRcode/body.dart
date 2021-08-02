import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';

class QRScreen extends StatefulWidget {
  @override
  _QRScreenState createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen> {
  String qrString = "Add Data";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create QR Code"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 70.0),
          child: Container(
            child: Column(children: <Widget>[
              Column(
                children: [
                  // qr code
                  BarcodeWidget(
                    color: Colors.green.shade900,
                    data: qrString,
                    height: 250,
                    width: 250,
                    barcode: Barcode.qrCode(),
                  ),

                  SizedBox(height: 30),
                  // link
                  Container(
                    width: MediaQuery.of(context).size.width * .8,
                    child: TextField(
                      onChanged: (val) {
                        setState(() {
                          qrString = val;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: "Enter you data here",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
