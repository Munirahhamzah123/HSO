import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static String residentIdKey = "USERKEY";
  static String residentNameKey = "USERNAMEKEY";
  static String residentName = "DISPLAYNAME";
  static String residentEmailKey = "USEREMAILKEY";
  static String residentProfilePicKey = "USERPROFILEPICKEY";

  //save data
  Future<bool> saveResidentUsername(String getUserName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(residentNameKey, getUserName);
  }

  Future<bool> saveResidentEmail(String getUserEmail) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(residentEmailKey, getUserEmail);
  }

  Future<bool> saveResidentId(String getUserId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(residentIdKey, getUserId);
  }

  Future<bool> saveDisplayName(String getDisplayName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(residentName, getDisplayName);
  }

  Future<bool> saveResidentProfileUrl(String getUserProfile) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(residentProfilePicKey, getUserProfile);
  }

  // get data
  Future<String> getResidentUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(residentNameKey);
  }

  Future<String> getResidentEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(residentEmailKey);
  }

  Future<String> getResidentId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(residentIdKey);
  }

  Future<String> getDisplayName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(residentName);
  }

  Future<String> getResidentProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(residentProfilePicKey);
  }

  void saveResidentName(name) {}
}
