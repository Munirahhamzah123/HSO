import 'package:flutter/material.dart';
import 'package:fyp/ServicesHelper/databaseMethod.dart';
import 'package:fyp/ServicesHelper/sharedpref_helper.dart';
import 'package:fyp/src/Screens/Forms/SwabTest/Swabpopoutnoti.dart';
import 'package:fyp/src/Screens/Forms/SwabTest/generate.dart';
import 'package:fyp/src/Screens/Profile/waveclipper.dart';
import 'package:fyp/src/Screens/testing.dart';
import 'package:google_fonts/google_fonts.dart';

class Swabtest extends StatefulWidget {
  @override
  _SwabtestState createState() => _SwabtestState();
}

String userEmail = "";
String userUid = "";
Stream swabAppoinment;

class _SwabtestState extends State<Swabtest> {
  int currentStep = 0;
  List<Step> mySteps = [
    Step(
        title: Text("Your Info !"),
        subtitle: Text('Please Check your data'),
        content: Column(
          children: <Widget>[
            Container(
              child: Column(
                children: [SwabPopoutNoti()],
              ),
            )
          ],
        ),
        // content: Text("Registration on Website"),
        isActive: true),
    /* Step(
      title: Text("Appoinment Approved ?"),
      subtitle: Text('Apply date'),
      state: StepState.editing,
      isActive: true,
      content: Column(
        children: [
          Container(
            child: Column(
              children: [
                Text("Apply Here!"),
                AddNewAppointment(),
              ],
            ),
          ),
        ],
      ),
    ),
    Step(
        title: Text("Swab Test Form"),
        subtitle: Text("Please fill in your details"),
        content: Container(
            child: Column(
          children: <Widget>[
            Text("Submit your details here"),
            HealthForm(),
          ],
        )),
        state: StepState.editing,
        isActive: true),*/
    Step(
        title: Text("Swab Test"),
        subtitle: Text("Show your QR Code"),
        content: Container(
            child: Column(
          children: [
            ManualQR(),
          ],
        )),
        state: StepState.editing,
        isActive: true),
    Step(
        title: Text("End"),
        content: Text("End"),
        state: StepState.complete,
        isActive: true),
  ];
  getSwabAppointmentStream(userUid) async {
    swabAppoinment = await DatabaseMethod().getSwabAppointment(userUid);
    print("Swab appoinment");
    print(swabAppoinment);
    setState(() {});
  }

  getMyInfoFromSharedPreferences() async {
    userEmail = await SharedPreferenceHelper().getResidentEmail();
    userUid = await SharedPreferenceHelper().getResidentId();
    setState(() {});
  }

  checkStatus() {
    // if (swabAppoinment.hasData) {
    //   print("HASSSSS DATAAAAAA");
    // }
    // print(swabAppoinment);
  }

  @override
  void initState() {
    // TODO: implement initState
    getMyInfoFromSharedPreferences();
    getSwabAppointmentStream(userUid);
    // checkStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<Object>(
          stream: swabAppoinment,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print("record exist");
              // currentStep = 1;
              // setState(() {});
            } else {
              print("record dont exist");
              // currentStep = 0;
              // setState(() {});
            }
            return ListView(
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
                            Text("\t\t\tSWABTEST",
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
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start, //start the word
                      children: [
                        Container(
                          child: Text(
                            userEmail,
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(
                                    color: Colors.green.shade900,
                                    fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  child: Stepper(
                    currentStep: this.currentStep,
                    steps: mySteps,
                    type: StepperType.vertical,
                    physics: ClampingScrollPhysics(),
                    /*onStepTapped: (step) {
                      setState(() {
                        this.currentStep = step;
                      });
                      print("onStepTapped : " + step.toString());
                      /* setState(() {
                        if (step > currentStep) {
                          currentStep = step;
                        }
                        //else {
                        //   currentStep = 0;
                        // }
                      });*/
                    },*/
                    onStepContinue: () {
                      setState(() {
                        if (this.currentStep < this.mySteps.length - 1) {
                          this.currentStep = this.currentStep + 1;
                        } else {
                          currentStep = 0;
                        }
                      });
                      print("onStepContinue : " + currentStep.toString());
                    },
                    /*onStepCancel: () {
                      setState(() {
                        if (this.currentStep > 0) {
                          this.currentStep = this.currentStep - 1;
                        } else {
                          this.currentStep = 0;
                        }
                      });
                      print("onStepCancel : " + currentStep.toString());
                    },*/
                    /*onStepContinue: () {
                      if (currentStep == 0) {
                        print("you are at step 0");
                      } else if (currentStep == 1) {
                        print("you are at step 1");
                      } else if (currentStep == 2) {
                        print("you are at step 2");
                      }
                      // setState(() {
                      //   if (currentStep < mySteps.length - 1) {
                      //     currentStep = currentStep + 1;
                      //   } else {
                      //     currentStep = 0;
                      //   }
                      // });
                    },*/
                  ),
                ),
              ],
            );
          }),
    );
  }
}
