import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedFunctions {

  static String sharedPreferencesUserLoggedInKey = "ISLOGGEDIN";
  static String sharedPreferencesUserNameKey = "USERNAMEKEY";
  static String sharedPreferencesUserEmailKey = "USERMAILKEY";
  static String sharedPreferencesUserStudentKey = "USERSTUDENTKEY";

  static Future<bool> saveUserLoggedInSharedPreference(bool isUserLoggedIn) async {
    print(isUserLoggedIn);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(sharedPreferencesUserLoggedInKey, isUserLoggedIn);
  }
  static Future<bool>saveUserStudentSharedPreference(bool isUserStudent) async {
    print(isUserStudent);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(sharedPreferencesUserStudentKey, isUserStudent);
  }
  static Future<bool> saveUserNameSharedPreference(String userName) async {
    print(userName);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(sharedPreferencesUserNameKey, userName);
  }
  static Future<bool> saveUserEmailSharedPreference(String userEmail) async {
    print(userEmail);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(sharedPreferencesUserEmailKey, userEmail);
  }


  static Future<bool?> getUserLoggedInSharedPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getBool(sharedPreferencesUserLoggedInKey);
  }
  static Future<bool?> getUserStudentSharedPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getBool(sharedPreferencesUserStudentKey);
  }
  static Future<String?> getUserNameSharedPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(sharedPreferencesUserNameKey);
  }
  static Future<String?> getUserEmailSharedPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(sharedPreferencesUserEmailKey);
  }
}