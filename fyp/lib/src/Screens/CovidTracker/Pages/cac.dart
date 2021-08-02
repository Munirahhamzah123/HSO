import 'package:flutter/material.dart';
import 'package:fyp/src/Screens/CovidTracker/datasource.dart';

class CACPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: DataSource.functionCac.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Text(
              DataSource.functionCac[index]['version'],
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(DataSource.functionCac[index]['func']),
              )
            ],
          );
        },
      ),
    );
  }
}
