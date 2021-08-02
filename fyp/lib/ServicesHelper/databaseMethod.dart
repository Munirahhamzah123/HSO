import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseMethod {
  getCurrentUser() async {
    // ignore: await_only_futures
    return await FirebaseAuth.instance.currentUser;
  }

  Future<Stream<QuerySnapshot>> getAnnouncement() async {
    return FirebaseFirestore.instance.collection("annoucement").snapshots();
  }

  Future<Stream<QuerySnapshot>> getMenu() async {
    return FirebaseFirestore.instance.collection("menu").snapshots();
  }

  Future signOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    await FirebaseAuth.instance.signOut();
    print("logged out");
  }

  Future addUserInfoToDB(String uid, Map<String, dynamic> userInfoMap) async {
    // FirebaseFirestore.instance.collection("user").add(data)
    return FirebaseFirestore.instance
        .collection("user")
        .doc(uid)
        .set(userInfoMap);
  }

  Future getUserDetails(String uid) async {
    return await FirebaseFirestore.instance
        .collection("Profile")
        .doc(uid)
        .get();
  }

  Future getSwabAppointment(String uid) async {
    print("from database side");
    print(uid);
    // ignore: await_only_futures
    return await FirebaseFirestore.instance
        .collection("swabTestAppoinment")
        .where("userId", isEqualTo: uid)
        .snapshots();
  }

  Future addSwabAppoinment(Map appoinmentInfoMap) async {
    return FirebaseFirestore.instance
        .collection("swabTestAppoinment")
        .doc()
        .set(appoinmentInfoMap);
  }

  Future addAnnoncement(Map announcementInfoMap) async {
    print(announcementInfoMap);
    return FirebaseFirestore.instance
        .collection("annoucement")
        .doc()
        .set(announcementInfoMap);
  }

  getProfile() {}
}
