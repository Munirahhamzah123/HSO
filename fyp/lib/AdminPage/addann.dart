import 'package:flutter/material.dart';
import 'package:fyp/ServicesHelper/databaseMethod.dart';

class AddAn extends StatefulWidget {
  const AddAn({Key key}) : super(key: key);

  @override
  _AddAnState createState() => _AddAnState();
}

class _AddAnState extends State<AddAn> {
  String _title, _content;
  // final auth = FirebaseAuth.instance;

  TextEditingController _titleController;
  TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    _contentController = TextEditingController(text: "");
    _titleController = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(50.0),
      child: Container(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextField(
              controller: _titleController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Title',
                labelStyle: TextStyle(color: Colors.black),
                hintText: 'enter your title',
              ),
              onChanged: (value) {
                setState(() {
                  _title = value;
                });
              },
            ),
          ),
          const SizedBox(height: 10.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: TextField(
              controller: _contentController,
              obscureText: false,
              decoration: InputDecoration(
                labelText: 'content',
                labelStyle: TextStyle(color: Colors.black),
                hintText: 'enter your content',
              ),
              onChanged: (value) {
                setState(() {
                  _content = value;
                });
              },
            ),
          ),
          const SizedBox(height: 10.0),
          RaisedButton(
            textColor: Colors.red, // foreground
            onPressed: () {
              print(_title);
              print(_content);

              Map<String, dynamic> bulbStatusMap = {
                "body": _content,
                "title": _title,
                "uploaded_on": DateTime.now(),
              };

              DatabaseMethod().addAnnoncement(bulbStatusMap);
            },
            child: Text('Add'),
          )
        ]),
      ),
    ));
  }
}
