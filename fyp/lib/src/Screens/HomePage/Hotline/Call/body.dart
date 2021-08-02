import 'package:flutter/material.dart';
import 'package:fyp/src/Screens/CovidTracker/datasource.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //SizedBox(height: 5),
      //Heading(text: 'Hospital KKM'),

      itemCount: DataSource.hospList.length,
      itemBuilder: (context, index) {
        return ExpansionTile(
          title: Text(
            DataSource.hospList[index]['name'],
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          backgroundColor: Colors.lightGreen.shade100,
          children: <Widget>[
            Image.asset(
              DataSource.hospList[index]['image'],
              height: 30,
              width: 70,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(DataSource.hospList[index]['hospital']),
            )
          ],
        );
      },
    );
  }
}
