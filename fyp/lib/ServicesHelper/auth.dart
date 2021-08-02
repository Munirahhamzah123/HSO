import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp/ServicesHelper/databaseMethod.dart';
import 'package:fyp/ServicesHelper/sharedpref_helper.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthMethod {
  final FirebaseAuth auth = FirebaseAuth.instance;

  getCurrentUser() async {
    // return await auth.currentUser;
    // ignore: await_only_futures
    return await auth.currentUser;
  }

  signInWithGoogle(BuildContext context) async {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    final GoogleSignIn _googleSignIn = GoogleSignIn();

    final GoogleSignInAccount googleSignInAccount =
        await _googleSignIn.signIn();

    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    UserCredential result =
        await _firebaseAuth.signInWithCredential(credential);

    User userDetails = result.user;

    if (result != null) {
      SharedPreferenceHelper().saveResidentEmail(userDetails.email);
      SharedPreferenceHelper().saveResidentId(userDetails.uid);
      SharedPreferenceHelper()
          .saveResidentUsername(userDetails.email.replaceAll("@gmail.com", ""));
      SharedPreferenceHelper().saveDisplayName(userDetails.displayName);
      SharedPreferenceHelper().saveResidentProfileUrl(userDetails.photoURL);

      Map<String, dynamic> userInfoMap = {
        "email": userDetails.email,
        "username": userDetails.email.replaceAll("@gmail.com", ""),
        "name": userDetails.displayName,
        "imgUrl": userDetails.photoURL
      };

      DatabaseMethod()
          .addUserInfoToDB(userDetails.uid, userInfoMap)
          .then((value) {
        // Navigator.pushReplacement(
        //     context, MaterialPageRoute(builder: (context) => Home()));
      });
    }
  }

  Future signOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    await auth.signOut();
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      User userDetails = result.user;

      if (result != null) {
        await DatabaseMethod().getUserDetails(userDetails.uid).then((result) {
          SharedPreferenceHelper().saveResidentEmail(result["email"]);
          SharedPreferenceHelper().saveResidentId(result.id);
          SharedPreferenceHelper().saveResidentUsername(
              result["email"].replaceAll("@gmail.com", ""));
          SharedPreferenceHelper().saveDisplayName(result["name"]);
          SharedPreferenceHelper().saveResidentProfileUrl(result["imgUrl"]);
        });
        return true;
      }
    } catch (e) {
      print("get error " + e.toString());
      return e;
    }
  }

  Future signUpWithEmailAndPassword(String email, String password,
      String displayname, BuildContext context) async {
    try {
      UserCredential result = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      User userDetails = result.user;

      if (result != null) {
        SharedPreferenceHelper().saveResidentEmail(userDetails.email);
        SharedPreferenceHelper().saveResidentId(userDetails.uid);
        SharedPreferenceHelper().saveResidentUsername(
            userDetails.email.replaceAll("@gmail.com", ""));
        SharedPreferenceHelper().saveDisplayName(displayname);
        SharedPreferenceHelper().saveResidentProfileUrl("basic");

        Map<String, dynamic> userInfoMap = {
          "email": userDetails.email,
          "username": userDetails.email.replaceAll("@gmail.com", ""),
          "name": displayname,
          "imgUrl": "basic"
        };

        DatabaseMethod().addUserInfoToDB(userDetails.uid, userInfoMap);

        return true;
      }
    } catch (e) {
      return e;
    }
  }
}
