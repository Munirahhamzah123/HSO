import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fyp/Components/rounded_button.dart';

// ignore: must_be_immutable
class EditContact extends StatefulWidget {
  String contactKey;

  EditContact({this.contactKey});

  @override
  _EditContactState createState() => _EditContactState();
}

class _EditContactState extends State<EditContact> {
  TextEditingController _nameController, _numberController;
  String _typeSelected = '';

  DatabaseReference _ref;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController = TextEditingController();
    _numberController = TextEditingController();
    _ref = FirebaseDatabase.instance.reference().child('Contacts');
    getContactDetail();
  }

  Widget _buildContactType(String title) {
    return InkWell(
      child: Container(
        height: 30,
        width: 75,
        decoration: BoxDecoration(
          color: _typeSelected == title ? Colors.pink : Colors.green[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      onTap: () {
        setState(() {
          _typeSelected = title;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Contact'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.only(
                    bottom: 20, top: 20, right: 8, left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        hintText: 'Enter Name',
                        prefixIcon: Icon(
                          Icons.account_circle,
                          size: 30,
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: EdgeInsets.all(15),
                      ),
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      controller: _numberController,
                      decoration: InputDecoration(
                        hintText: 'Enter Phone Number',
                        prefixIcon: Icon(
                          Icons.phone_iphone,
                          size: 30,
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: EdgeInsets.all(15),
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      height: 40,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _buildContactType('PNG'),
                          SizedBox(width: 3),
                          _buildContactType('KDH'),
                          SizedBox(width: 3),
                          _buildContactType('PLS'),
                          SizedBox(width: 3),
                          _buildContactType('JHR'),
                          SizedBox(width: 3),
                          _buildContactType('KTN'),
                          SizedBox(width: 3),
                          _buildContactType('MLK'),
                          SizedBox(width: 3),
                          _buildContactType('NSN'),
                          SizedBox(width: 3),
                          _buildContactType('PHG'),
                          SizedBox(width: 3),
                          _buildContactType('PRK'),
                          SizedBox(width: 3),
                          _buildContactType('SBH'),
                          SizedBox(width: 3),
                          _buildContactType('SWK'),
                          SizedBox(width: 3),
                          _buildContactType('SGR'),
                          SizedBox(width: 3),
                          _buildContactType('TRG'),
                          SizedBox(width: 3),
                          _buildContactType('KUL'),
                          SizedBox(width: 3),
                          _buildContactType('LBN'),
                          SizedBox(width: 3),
                          _buildContactType('PJY'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: RoundedButton(
                          textColor: Colors.white,
                          color: Colors.teal[900],
                          text: "SAVE CONTACT",
                          press: () => saveContact()),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  getContactDetail() async {
    DataSnapshot snapshot = await _ref.child(widget.contactKey).once();

    Map contact = snapshot.value;

    _nameController.text = contact['name'];

    _numberController.text = contact['number'];

    setState(() {
      _typeSelected = contact['type'];
    });
  }

  void saveContact() {
    String name = _nameController.text;
    String number = _numberController.text;

    Map<String, String> contact = {
      'name': name,
      'number': number,
      'type': _typeSelected,
    };

    _ref.child(widget.contactKey).update(contact).then((value) {
      Navigator.pop(context);
    });
  }
}
