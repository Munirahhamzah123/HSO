import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fyp/src/Screens/HomePage/CacPage/Johor/data.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(height: 120),
          Container(
            margin: EdgeInsets.symmetric(vertical: 12),
            height: 350,
            child: Swiper(
              autoplayDelay: 1500,
              curve: Curves.easeIn,
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        scale: 1, //1-bigger 10-smaller
                        alignment: Alignment.center,
                        image: AssetImage(image1[index]),
                      ),
                    ),
                  ),
                );
              },
              viewportFraction: 0.8,
              scale: 0.9,
              pagination: SwiperPagination(),
            ),
          ),
        ],
      ),
    );
  }
}
