import 'package:flutter/material.dart';

class MalaysiaPanel extends StatelessWidget {
  final Map malaysiaData;

  const MalaysiaPanel({Key key, this.malaysiaData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              StatusPanel(
                title: 'New Cases',
                textColor: Colors.orange,
                count: malaysiaData['todayCases'].toString(),
              ),
              StatusPanel(
                title: 'Recovered',
                textColor: Colors.green,
                count: malaysiaData['todayRecovered'].toString(),
              ),
              StatusPanel(
                title: 'Deaths',
                textColor: Colors.red,
                count: malaysiaData['todayDeaths'].toString(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class StatusPanel extends StatelessWidget {
  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  const StatusPanel(
      {Key key, this.panelColor, this.textColor, this.title, this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //double width = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(10),
      height: 120,
      width: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 4),
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 5)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 15),
          Text(count,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 30, color: textColor)),
          SizedBox(height: 15),
          Text(title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black)),
        ],
      ),
    );
  }
}
