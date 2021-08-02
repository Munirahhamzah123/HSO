import 'package:flutter/material.dart';
import 'package:fyp/src/Screens/CovidTracker/Pages/cac.dart';
import 'package:fyp/src/Screens/CovidTracker/datasource.dart';
import 'package:fyp/src/Screens/HomePage/CacPage/Johor/johor.dart';
import 'package:fyp/src/Screens/HomePage/CacPage/Kedah/kedah.dart';
import 'package:fyp/src/Screens/HomePage/CacPage/Kelantan/kelantan.dart';
import 'package:fyp/src/Screens/HomePage/CacPage/Labuan/labuan.dart';
import 'package:fyp/src/Screens/HomePage/CacPage/Melaka/melaka.dart';
import 'package:fyp/src/Screens/HomePage/CacPage/NegeriSembilan/negerisembilan.dart';
import 'package:fyp/src/Screens/HomePage/CacPage/Pahang/pahang.dart';
import 'package:fyp/src/Screens/HomePage/CacPage/Penang/penang.dart';
import 'package:fyp/src/Screens/HomePage/CacPage/Perak/perak.dart';
import 'package:fyp/src/Screens/HomePage/CacPage/Perlis/perlis.dart';
import 'package:fyp/src/Screens/HomePage/CacPage/Persekutuan/persekutuan.dart';
import 'package:fyp/src/Screens/HomePage/CacPage/Sabah/sabah.dart';
import 'package:fyp/src/Screens/HomePage/CacPage/Sarawak/sarawak.dart';
import 'package:fyp/src/Screens/HomePage/CacPage/Selangor/selangor.dart';
import 'package:fyp/src/Screens/HomePage/CacPage/Terengganu/terengganu.dart';
import 'package:fyp/src/Screens/HomePage/Hotline/body.dart';

class ScreenCac extends StatelessWidget {
  final Color primaryColor = Colors.green.shade900;
  final Color secondaryColor = Colors.white;
  final Color thirdColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Theme(
        data: ThemeData(
          primaryColor: primaryColor,
          appBarTheme: AppBarTheme(
            color: Colors.green.shade200,
            textTheme: TextTheme(
              // ignore: deprecated_member_use
              title: TextStyle(
                color: thirdColor,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            iconTheme: IconThemeData(color: thirdColor),
            actionsIconTheme: IconThemeData(color: secondaryColor),
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('COVID-19 HOTLINE'),
            bottom: TabBar(
              isScrollable: true,
              labelColor: primaryColor,
              unselectedLabelColor: secondaryColor,
              indicatorColor: Colors.white,
              //indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  )),
              tabs: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text("CAC"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text("HOSPITAL"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text("CONTACT"),
                ),
                /* Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text("OTHER AGENCIES"),
                ),*/
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              //CAC Tab
              Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 5),
                      //CAC Function
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 20), // space between start and end
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              children: [
                                Spacer(), //space
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => CACPage()));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.teal.shade800,
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      'FUNCTION CAC',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 10),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //selangor
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Selangor()));
                            },
                            child: CacStateCard(
                              image: 'assets/images/slgr.PNG',
                              state: 'SELANGOR',
                            ),
                          ),

                          //johor
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Johor()));
                            },
                            child: CacStateCard(
                              image: 'assets/images/jhr.PNG',
                              state: 'JOHOR',
                            ),
                          ),

                          //kelantan
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Kelantan()));
                            },
                            child: CacStateCard(
                              image: 'assets/images/kel.PNG',
                              state: 'KELANTAN',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //pahang
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Pahang()));
                            },
                            child: CacStateCard(
                              image: 'assets/images/pahang1.PNG',
                              state: 'PAHANG',
                            ),
                          ),

                          //WP KL & Putrajaya
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Persekutuan()));
                            },
                            child: CacStateCard(
                              image: 'assets/images/persekutuan.PNG',
                              state: 'WP KL & PUTRAJAYA',
                            ),
                          ),

                          //labuan
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Labuan()));
                            },
                            child: CacStateCard(
                              image: 'assets/images/labuan1.PNG',
                              state: 'WP LABUAN',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //kedah
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Kedah()));
                            },
                            child: CacStateCard(
                              image: 'assets/images/kedah1.PNG',
                              state: 'KEDAH',
                            ),
                          ),

                          //Penang
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Penang()));
                            },
                            child: CacStateCard(
                              image: 'assets/images/penang.PNG',
                              state: 'PENANG',
                            ),
                          ),

                          //Perlis
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Perlis()));
                            },
                            child: CacStateCard(
                              image: 'assets/images/prlis.PNG',
                              state: 'PERLIS',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //melaka
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Melaka()));
                            },
                            child: CacStateCard(
                              image: 'assets/images/mlk.PNG',
                              state: 'MELAKA',
                            ),
                          ),

                          //perak
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Perak()));
                            },
                            child: CacStateCard(
                              image: 'assets/images/prk.PNG',
                              state: 'PERAK',
                            ),
                          ),

                          //negeri sembilan
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NegeriSembilan()));
                            },
                            child: CacStateCard(
                              image: 'assets/images/n9.PNG',
                              state: 'NEGERI SEMBILAN',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //Terengganu
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Terengganu()));
                            },
                            child: CacStateCard(
                              image: 'assets/images/ganu.PNG',
                              state: 'TERENGGANU',
                            ),
                          ),

                          //sabah
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Sabah()));
                            },
                            child: CacStateCard(
                              image: 'assets/images/sbh.PNG',
                              state: 'SABAH',
                            ),
                          ),

                          //sarawak
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Sarawak()));
                            },
                            child: CacStateCard(
                              image: 'assets/images/swk.PNG',
                              state: 'SARAWAK',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),

              //Hospital List Tab
              Padding(
                padding: const EdgeInsets.only(
                    top: 5, bottom: 5, right: 20, left: 5),
                child: Container(
                  child: ListView.builder(
                    itemCount: DataSource.hospList.length,
                    itemBuilder: (context, index) {
                      return ExpansionTile(
                        leading: Icon(
                          Icons.flag_rounded,
                          color: Colors.green.shade900,
                        ),
                        title: Text(
                          DataSource.hospList[index]['name'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        children: <Widget>[
                          Image.asset(
                            DataSource.hospList[index]['image'],
                            height: 50,
                            width: 100,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text(
                              DataSource.hospList[index]['hospital'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
              ),

              //Contact Tab
              Padding(
                padding: const EdgeInsets.only(
                    top: 5, bottom: 5, right: 10, left: 5),
                child: Container(
                  child: ListView.builder(
                    itemCount: DataSource.gerakanList.length,
                    itemBuilder: (context, index) {
                      return ExpansionTile(
                        leading: Icon(
                          Icons.call_sharp,
                          color: Colors.green.shade900,
                        ),
                        title: Text(
                          DataSource.gerakanList[index]['place'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text(
                              DataSource.gerakanList[index]['details'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
              ),

              //Other Agencies Tab
              /* Container(
                child: Text("Other Agencies "),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}

class CacStateCard extends StatelessWidget {
  const CacStateCard({
    Key key,
    this.image,
    this.state,
  }) : super(key: key);
  final String image;
  final String state;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 4),
                color: Colors.teal.shade100.withOpacity(0.5),
                blurRadius: 2,
                spreadRadius: 3)
          ]),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Position(image: '$image'),
          StateText(title: '$state'),
        ],
      ),
    );
  }
}
