import 'package:flutter/material.dart';

class Vitaminc extends StatefulWidget {
  @override
  _VitamincState createState() => _VitamincState();
}

class _VitamincState extends State<Vitaminc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('VITAMIN C'), centerTitle: true),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Row(
                  children: [
                    Center(child: Text('also known as ')),
                    Text(
                      'ABSCORBID ACID',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                  child: GridView.count(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: <Widget>[
                  Container(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/guava1.jpg',
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 3),
                        Text(
                          "GUAVA ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("228 mg/100g"),
                      ],
                    ),
                    color: Colors.transparent,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/blackcurrant.jpg',
                        ),
                        SizedBox(height: 3),
                        Text(
                          "BLACKCURRANT ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("200 mg/100g"),
                      ],
                    ),
                    color: Colors.transparent,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/yellowbell.jpg',
                        ),
                        SizedBox(height: 3),
                        Text(
                          "YELLOW BELL PEPPER ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("183 mg/100g"),
                      ],
                    ),
                    color: Colors.transparent,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/redbell.png',
                          scale: 7,
                        ),
                        Text(
                          "RED BELL PEPPER ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("128 mg/100g"),
                      ],
                    ),
                    color: Colors.transparent,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/kiwi.jpg',
                        ),
                        Text(
                          "KIWI FRUIT ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("90 mg/100g"),
                      ],
                    ),
                    color: Colors.transparent,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/brocolli.jpg',
                        ),
                        Text(
                          "BROCOLLI ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("90 mg/100g"),
                      ],
                    ),
                    color: Colors.transparent,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/greenbell.jpg',
                          scale: 6,
                        ),
                        Text(
                          "GREEN BELL PEPPER ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("80 mg/100g"),
                      ],
                    ),
                    color: Colors.transparent,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/papaya.jpg',
                        ),
                        Text(
                          "PAPAYA ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("60 mg/100g"),
                      ],
                    ),
                    color: Colors.transparent,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/strawberry.jpg',
                        ),
                        Text(
                          "STRAWBERRY ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("60 mg/100g"),
                      ],
                    ),
                    color: Colors.transparent,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/orange.jpg',
                        ),
                        Text(
                          "ORANGE",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("53 mg/100g"),
                      ],
                    ),
                    color: Colors.transparent,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/lemon1.jpg',
                        ),
                        Text(
                          "LEMON ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("53 mg/100g"),
                      ],
                    ),
                    color: Colors.transparent,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/pineapple.jpg',
                        ),
                        Text(
                          "PINEAPPLE",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("48 mg/100g"),
                      ],
                    ),
                    color: Colors.transparent,
                  ),
                ],
              ))
            ],
          ),
        ),
        /*child: Column(
          children: [
            Row(
              children: [
                Text('also known as '),
                Text(
                  'ABSCORBID ACID',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(height: 10),
            Expanded(
                child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: _listItem
                  .map((item) => Card(
                        color: Colors.transparent,
                        elevation: 0,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: AssetImage(item),
                                      fit: BoxFit.cover)),
                              child: Transform.translate(
                                offset: Offset(50, -50),
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 65, vertical: 63),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white),
                                  child: Icon(
                                    Icons.bookmark_border,
                                    size: 15,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ))
                  .toList(),
            )),
          ],
        ),*/
      ),
    );
  }
}
