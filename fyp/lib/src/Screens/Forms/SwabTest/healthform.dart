import 'package:flutter/material.dart';

class HealthForm extends StatefulWidget {
  const HealthForm({Key key}) : super(key: key);

  @override
  _HealthFormState createState() => _HealthFormState();
}

class _HealthFormState extends State<HealthForm> {
  String travel, phone, postcode, address, ic;
  TextEditingController _travel = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                child: Text(
                  "Have you travelled oversease the past 14 days?",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade900,
                  ),
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: TextFormField(
                  controller: _travel,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(hintText: 'YES/NO'),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please Enter Name';
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    travel = value;
                  },
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Container(
                child: Text(
                  "Have you had any of the fot 14 days?",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade900,
                  ),
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: TextFormField(
                  controller: _travel,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(hintText: 'YES/NO'),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please Enter Name';
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    travel = value;
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
