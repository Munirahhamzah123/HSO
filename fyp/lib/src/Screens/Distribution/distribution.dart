import 'package:flutter/material.dart';
import 'package:fyp/constants.dart';
import 'package:fyp/src/Screens/Distribution/Food/foodmenu.dart';
import 'package:fyp/src/Screens/Distribution/Food/vitaminc.dart';
import 'package:fyp/src/Screens/Distribution/Medicine/createorder.dart';
import 'package:fyp/src/Screens/Distribution/Medicine/listorder.dart';

class ServiceScreen extends StatelessWidget {
  final Color primaryColor = kGradient3Color;
  final Color secondaryColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Theme(
        data: ThemeData(
          primaryColor: primaryColor,
          appBarTheme: AppBarTheme(
            color: Colors.green.shade200,
            textTheme: TextTheme(
              // ignore: deprecated_member_use
              title: TextStyle(
                color: secondaryColor,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            iconTheme: IconThemeData(color: secondaryColor),
            actionsIconTheme: IconThemeData(
              color: secondaryColor,
            ),
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              isScrollable: true,
              labelStyle: TextStyle(fontSize: 16),
              labelColor: primaryColor,
              unselectedLabelColor: secondaryColor,
              indicatorColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  )),
              tabs: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      right: 50, left: 50, bottom: 8, top: 8),
                  child: Text("FOOD"),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      right: 50, left: 50, bottom: 8, top: 8),
                  child: Text("MEDICINE"),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              //MEDICINE Tab
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                      child: Column(
                    children: [
                      SizedBox(height: 10),
                      FoodPopoutNoti(),
                      SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Vitaminc()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.green.shade900.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(30)),
                              padding: EdgeInsets.only(
                                  right: 30, left: 30, top: 10, bottom: 10),
                              child: Text(
                                'FRUITS WITH HIGH VITAMIN C',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.green.shade900,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            width: 20,
                          ),
                          Image.asset(
                            'assets/images/doctor1.png',
                            height: 120,
                            width: 120,
                            fit: BoxFit.cover,
                          ),
                          Text(
                            'WHY OUR BODY \nNEEDS VITAMIN C? ',
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.orange[900],
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 30,
                              left: 30,
                              top: 10,
                            ),
                            child: Image.asset(
                              'assets/images/vitc.png',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),

                      /*Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            Text(
                              'Test',
                              style: TextStyle(
                                color: Colors.teal.shade900,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),*/
                    ],
                  )),
                ),
              ),

              //FOOD Tab
              Container(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 8,
                          width: 20,
                        ),
                        Image.asset(
                          'assets/images/doctor3.png',
                          height: 180,
                          width: 120,
                          //fit: BoxFit.cover,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          'Have you run out\n of medicine ? ',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.green.shade900,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => CreateOrder()),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.green.shade900.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(30)),
                            padding: EdgeInsets.only(
                                right: 30, left: 30, top: 10, bottom: 10),
                            child: Text(
                              'CLICK HERE TO ORDER MEDICINE',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.green.shade900,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => new ListOrder()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.green.shade900.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(30)),
                            padding: EdgeInsets.only(
                                right: 30, left: 30, top: 10, bottom: 10),
                            child: Text(
                              'VIEW HISTORY ORDER',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.green.shade900,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 80),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Image.asset(
                              'assets/images/pill.png',
                              height: 50,
                              width: 80,
                              //fit: BoxFit.cover,
                            ),
                            Image.asset(
                              'assets/images/ointment.png',
                              height: 70,
                              width: 80,
                              //fit: BoxFit.cover,
                            ),
                            Image.asset(
                              'assets/images/inhaler.png',
                              height: 70,
                              width: 80,
                              //fit: BoxFit.cover,
                            ),
                            Image.asset(
                              'assets/images/pill_rounded.png',
                              height: 50,
                              width: 80,
                              //fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
