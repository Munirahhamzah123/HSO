import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fyp/ServicesHelper/sharedpref_helper.dart';
import 'package:fyp/src/Screens/Profile/waveclipper.dart';
import 'package:fyp/src/Screens/testing.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  GlobalKey<FormState> _key = new GlobalKey();
  bool _autovalidate = false;
  String name,
      gender,
      ic,
      phone,
      address,
      city,
      state,
      postcode,
      formatdate,
      category;

  List _gender = ['Male', 'Female'];
  List _category = ['PERSON UNDER INVESTIGATION (PUI)', 'CLOSE CONTACT'];
  List _state = [
    'PERLIS',
    'KEDAH',
    'PENANG',
    'PERAK',
    'SELANGOR',
    'MELAKA',
    'NEGERI SEMBILAN',
    'JOHOR',
    'KELANTAN',
    'TERENGGANU',
    'PAHANG',
    'SABAH',
    'SARAWAK',
    'WP KUALA LUMPUR',
    'WP PUTRAJAYA',
    'WP LABUAN'
  ];

  String userEmail = "";
  String userUid = "";

  getMyInfoFromSharedPreferences() async {
    userEmail = await SharedPreferenceHelper().getResidentEmail();
    userUid = await SharedPreferenceHelper().getResidentId();
    setState(() {
      print(userEmail);
      print(userUid);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getMyInfoFromSharedPreferences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DateTime _currentdate = new DateTime.now();
    formatdate = new DateFormat.yMMMMd().format(_currentdate);
    return new Scaffold(
      body: new ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClipPath(
                clipper: WaveClipper2(),
                child: Container(
                  child: Column(),
                  width: double.infinity,
                  height: 185,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Colors.green.shade100,
                    Colors.green.shade100
                  ])),
                ),
              ),
              ClipPath(
                clipper: WaveClipper3(),
                child: Container(
                  child: Column(),
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.teal, Colors.green.shade900])),
                ),
              ),
              ClipPath(
                clipper: WaveClipper1(),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 40,
                      ),
                      Text("PROFILE",
                          style: GoogleFonts.amiko(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 0.5,
                                  fontSize: 26))),
                    ],
                  ),
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.teal, Colors.green],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight)),
                ),
              ),
              Positioned(
                top: 30,
                left: 6,
                child: IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.arrow_back),
                  iconSize: 35,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TestingScreen()));
                  },
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 5),
            child: Form(
              key: _key,
              // ignore: deprecated_member_use
              autovalidate: _autovalidate,
              child: FormUI(),
            ),
          )
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget FormUI() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Text(
            'p/s : Once you have submitted, you cannot edit or delete the details.\n',
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 45, right: 70, bottom: 5),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green, width: 1.5),
            borderRadius: BorderRadius.circular(25),
          ),
          child: DropdownButton(
            hint: Text('Category',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
            dropdownColor: Colors.green.shade50,
            elevation: 6,
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 36,
            isExpanded: true,
            value: category,
            style: TextStyle(color: Colors.black, fontSize: 16),
            onChanged: (value) {
              setState(() {
                category = value;
              });
            },
            items: _category.map((value) {
              return DropdownMenuItem(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
        SizedBox(height: 12),
        Column(
          children: <Widget>[
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: buildInputDecoration(Icons.person, "Full Name"),
              validator: validateName,
              onSaved: (String val) {
                name = val;
              },
            ),
          ],
        ),
        SizedBox(height: 12),
        Container(
          padding: EdgeInsets.only(left: 45, right: 70, bottom: 5),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green, width: 1.5),
            borderRadius: BorderRadius.circular(25),
          ),
          child: DropdownButton(
            hint: Text('Choose Gender',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
            dropdownColor: Colors.green.shade50,
            elevation: 6,
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 36,
            isExpanded: true,
            value: gender,
            style: TextStyle(color: Colors.black, fontSize: 16),
            onChanged: (value) {
              setState(() {
                gender = value;
              });
            },
            items: _gender.map((value) {
              return DropdownMenuItem(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
        SizedBox(height: 12),
        Column(
          children: <Widget>[
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: buildInputDecoration(
                  Icons.chrome_reader_mode_rounded, "Identity Card No"),
              validator: validateIc,
              onSaved: (String val) {
                ic = val;
              },
            ),
          ],
        ),
        SizedBox(height: 12),
        Column(
          children: <Widget>[
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: buildInputDecoration(Icons.phone, "Phone No"),
              validator: validatePhone,
              onSaved: (String val) {
                phone = val;
              },
            ),
          ],
        ),
        SizedBox(height: 12),
        Column(
          children: <Widget>[
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: buildInputDecoration(Icons.location_city, "Address"),
              validator: validateAddress,
              maxLines: 3,
              onSaved: (String val) {
                address = val;
              },
            ),
          ],
        ),
        SizedBox(height: 12),
        Column(
          children: <Widget>[
            TextFormField(
              keyboardType: TextInputType.text,
              decoration:
                  buildInputDecoration(Icons.location_city_outlined, "City"),
              validator: validateCity,
              onSaved: (String val) {
                city = val;
              },
            ),
          ],
        ),
        SizedBox(height: 12),
        Column(
          children: <Widget>[
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: buildInputDecoration(Icons.location_on, "Postcode"),
              validator: validatePostcode,
              onSaved: (String val) {
                postcode = val;
              },
            ),
          ],
        ),
        SizedBox(height: 12),
        Container(
          padding: EdgeInsets.only(left: 45, right: 70, bottom: 5),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green, width: 1.5),
            borderRadius: BorderRadius.circular(25),
          ),
          child: DropdownButton(
            hint: Text('Choose State',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                )),
            dropdownColor: Colors.green.shade50,
            elevation: 6,
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 36,
            isExpanded: true,
            value: state,
            style: TextStyle(color: Colors.black, fontSize: 16),
            onChanged: (value) {
              setState(() {
                state = value;
              });
            },
            items: _state.map((value) {
              return DropdownMenuItem(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
        SizedBox(height: 15),
        Center(
          child: SizedBox(
            width: 200,
            height: 50,
            child: RaisedButton(
              color: Colors.green.shade800,
              onPressed: _sendToServer,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                  side: BorderSide(color: Colors.green.shade800, width: 2)),
              textColor: Colors.white,
              child: Text(
                "SUBMIT",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ),
        SizedBox(height: 20.0),
      ],
    );
  }

  _sendToServer() {
    if (_key.currentState.validate()) {
      _key.currentState.save();
      DatabaseReference ref = FirebaseDatabase.instance.reference();
      var data = {
        "name": name,
        "gender": gender,
        "icno": ic,
        "phone": phone,
        "address": address,
        "city": city,
        "state": state,
        "postcode": postcode,
        "date": formatdate,
        "category": category,
        "user": userUid,
        "email": userEmail,
      };
      print(name);
      print(gender);
      print(ic);
      print(phone);
      print(address);
      print(city);
      print(state);
      print(postcode);
      print(userUid);
      print(userEmail);
      print(category);
      ref.child('Profile').push().set(data).then((v) {
        _key.currentState.reset();
      });
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => TestingScreen()));
    } else {
      setState(() {
        _autovalidate = true;
      });
    }
  }
}

InputDecoration buildInputDecoration(IconData icons, String hinttext) {
  return InputDecoration(
    hintText: hinttext,
    prefixIcon: Icon(icons),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
      borderSide: BorderSide(color: Colors.green.shade900, width: 3),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
      borderSide: BorderSide(
        color: Colors.green.shade900,
        width: 3,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
      borderSide: BorderSide(
        color: Colors.green,
        width: 1.5,
      ),
    ),
  );
}

String validateName(String val) {
  return val.length == 0 ? "Enter Full Name" : null;
}

String validateAddress(String val) {
  return val.length == 0 ? "Enter Address (eg: M02 Restu USM)" : null;
}

String validateCity(String val) {
  return val.length == 0 ? "Enter City (eg: Gelugor) " : null;
}

String validatePostcode(String val) {
  return val.length == 0 ? "Enter Postcode (eg:11800)" : null;
}

String validateIc(String val) {
  return val.length == 0 ? "Enter Ic (eg: 981111081234)" : null;
}

String validatePhone(String val) {
  return val.length == 0 ? "Enter Phone Number" : null;
}
