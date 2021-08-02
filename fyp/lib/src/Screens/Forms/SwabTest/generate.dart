import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

class ManualQR extends StatefulWidget {
  const ManualQR({Key key}) : super(key: key);

  @override
  _ManualQRState createState() => _ManualQRState();
}

class _ManualQRState extends State<ManualQR> {
  String qrString = "Add Data";
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: <Widget>[
      Column(
        children: [
          // qr code
          BarcodeWidget(
            color: Colors.green.shade900,
            data: qrString,
            height: 150,
            width: 150,
            barcode: Barcode.qrCode(),
          ),

          SizedBox(height: 10),
          // link
          Container(
            width: MediaQuery.of(context).size.width * .6,
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
    ]));
  }
}
