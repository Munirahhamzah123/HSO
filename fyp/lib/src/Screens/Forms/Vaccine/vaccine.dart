import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fyp/src/Screens/Forms/Vaccine/data.dart';
import 'package:fyp/src/Screens/Forms/Vaccine/vaccinecard.dart';
import 'package:fyp/src/Screens/Profile/waveclipper.dart';
import 'package:fyp/src/Screens/testing.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class Vaccine extends StatefulWidget {
  @override
  _VaccineState createState() => _VaccineState();
}

class _VaccineState extends State<Vaccine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClipPath(
                clipper: WaveClipper2(),
                child: Container(
                  child: Column(),
                  width: double.infinity,
                  height: 185,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Colors.green.shade100,
                    Colors.green.shade100
                  ])),
                ),
              ),
              ClipPath(
                clipper: WaveClipper3(),
                child: Container(
                  child: Column(),
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.teal, Colors.green.shade900])),
                ),
              ),
              ClipPath(
                clipper: WaveClipper1(),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 40,
                      ),
                      Text("\t\t\tVACCINE",
                          style: GoogleFonts.amiko(
                              textStyle: TextStyle(
                                  color: Colors.white, fontSize: 24))),
                    ],
                  ),
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.teal, Colors.green],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight)),
                ),
              ),
              Positioned(
                top: 30,
                left: 6,
                child: IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.arrow_back),
                  iconSize: 35,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TestingScreen()));
                  },
                ),
              ),
            ],
          ),
          VaccineCard(),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, //start the word
                    children: [
                      Text(
                        "*PLEASE EQUIP YOURSELF WITH ACCURATE INFORMATION BEFORE \nMAKING A BOOKING",
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(color: Colors.red, fontSize: 10),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, //start the word
                    children: [
                      Text(
                        "Register:",
                        style: Theme.of(context).textTheme.headline6.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      /*decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      ),*/

                      child: Column(children: [
                        Center(
                            child: Linkify(
                          text: 'https://www.vaksincovid.gov.my/en/register/',
                          style: TextStyle(fontSize: 13),
                          onOpen: _onOpen,
                        )),
                      ]))
                ],
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, //start the word
                    children: [
                      Text("Apply Now:",
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14)),
                    ],
                  ),
                  Spacer(),
                  Container(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      /*decoration: BoxDecoration(
                        color: Colors.green.shade50,
                      ),*/
                      child: Column(children: [
                        Center(
                            child: Linkify(
                          text: 'https://www.vaksincovid.gov.my/astrazeneca/',
                          style: TextStyle(fontSize: 13),
                          onOpen: _onOpen,
                        )),
                      ]))
                ],
              ),
            ),
          ),
          Container(
            //margin: EdgeInsets.symmetric(vertical: 12),
            height: 350,
            child: Swiper(
              //autoplayDelay: 1500,
              //curve: Curves.easeIn,

              itemBuilder: (BuildContext context, int index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        scale: 1, //1-bigger 10-smaller
                        //alignment: Alignment.center,
                        image: AssetImage(image1[index]),
                      ),
                    ),
                  ),
                );
              },
              itemCount: 7,
              viewportFraction: 0.8, //adjust the images fraction
              scale: 0.9, //space between images
              pagination: SwiperPagination(),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _onOpen(LinkableElement link) async {
    if (await canLaunch(link.url)) {
      await launch(link.url);
    } else {
      throw ('Cannot open link $link');
    }
  }
}

showDialogFunc(context, img, title, desc) {
  return showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(15),
            height: 320,
            width: MediaQuery.of(context).size.width * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    img,
                    width: 200,
                    height: 200,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  // width: 200,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      desc,
                      maxLines: 3,
                      style: TextStyle(fontSize: 15, color: Colors.grey[500]),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

//Preventions
Widget prevention({image}) {
  return Container(
    child: Container(
      width: 210,
      margin: EdgeInsets.only(right: 10),
      child: Card(
        elevation: 10,
        child: Padding(
          padding: EdgeInsets.only(top: 3),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  image,
                  scale: 1.25,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
