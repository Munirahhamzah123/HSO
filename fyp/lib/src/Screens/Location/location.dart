import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  var locationMessage = ""; //location coordinates
  var addressMessage = ""; //address

  void getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lastPosition = await Geolocator.getLastKnownPosition();
    print(lastPosition);
    var lat = position.latitude;
    var long = position.longitude;
    print("$lat, $long");
    setState(() {
      locationMessage = "Latitude : $lat \nLongitude: $long";
      getAddressFromCoordinates(Coordinates(lat, long));
    });
  }

  void getAddressFromCoordinates(Coordinates cords) async {
    var addresses = await Geocoder.local.findAddressesFromCoordinates(cords);
    var first = addresses.first;
    print(" ${first.addressLine}");
    setState(() {
      addressMessage = "Address: \n${first.addressLine}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      appBar: AppBar(
        backgroundColor: Colors.green.shade100,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.location_on, size: 46, color: Colors.black),
            SizedBox(height: 10),
            Text('User Location',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Text(
              " $locationMessage",
              style: TextStyle(fontSize: 12),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(right: 50, left: 50),
              child: Center(
                  child: Text(
                " $addressMessage",
                style: TextStyle(fontSize: 12),
              )),
            ),
            SizedBox(height: 10),
            FlatButton(
                onPressed: () {
                  getCurrentLocation();
                },
                color: Colors.green[900],
                child: Text("Get Current Location",
                    style: TextStyle(color: Colors.white, fontSize: 16)))
          ],
        ),
      ),
    );
  }
}
