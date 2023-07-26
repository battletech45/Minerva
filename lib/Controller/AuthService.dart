import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minerva/Controller/FirebaseFunctions.dart';
import 'package:minerva/Controller/SharedFunctions.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isStudent = false;
  List<String> tokens = [];

  Future signInWithEmailAndPassword(String email, String password) async {
    var studentData = await FirebaseFunctions().getStudentData(email);
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      if (studentData.docs.isNotEmpty) {
        await SharedFunctions.saveUserLoggedInSharedPreference(true);
        await SharedFunctions.saveUserStudentSharedPreference(true);
        await SharedFunctions.saveUserEmailSharedPreference(email);
        await SharedFunctions.saveUserNameSharedPreference(
            studentData.docs[0].get('studentName'));
        if (studentData.docs[0].get('password') != password) {
          await FirebaseFunctions().updateStudentPassword(
              password, studentData.docs[0].get('studentID'));
        }
      } else {
        var teacherData = await FirebaseFunctions().getTeacherData(email);
        await SharedFunctions.saveUserStudentSharedPreference(false);
        await SharedFunctions.saveUserLoggedInSharedPreference(true);
        await SharedFunctions.saveUserEmailSharedPreference(email);
        await SharedFunctions.saveUserNameSharedPreference(
            teacherData.docs[0].get('teacherName'));
        if (teacherData.docs[0].get('password') != password) {
          await FirebaseFunctions().updateStudentPassword(
              password, teacherData.docs[0].get('teacherID'));
        }
      }
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
  }

  Future signout() async {
    await FirebaseAuth.instance.signOut();
    await SharedFunctions.saveUserStudentSharedPreference(false);
    await SharedFunctions.saveUserEmailSharedPreference('');
    await SharedFunctions.saveUserLoggedInSharedPreference(false);
    await SharedFunctions.saveUserNameSharedPreference('');
  }
  /*
    Future _getUserData(String email,BuildContext context) async {
    var val = await SharedFunctions.getUserEmailSharedPreference();
    setState(() {
      email = val!;
    });
    var isOK = await SharedFunctions.getUserStudentSharedPreference();
    if(isOK!) {
      var user = await FirebaseFunctions().getStudentData(email);
      setState(() {
        userID = user.docs[0].get('studentID');
        setState(() {
          isStudent = isOK;
        });
      });
    }
    else {
      var user = await FirebaseFunctions().getTeacherData(email);
      setState(() {
        userID = user.docs[0].get('teacherID');
      });
    }
  }
*/

  Future passCheck(String userID,String userEmail,String oldPassword, String newPassword, String safeNewPassword) async {
    if (newPassword.isNotEmpty && safeNewPassword.isNotEmpty) {
      if (newPassword == safeNewPassword) {
        print("Passwords are succesfully matched");
        final _credential = EmailAuthProvider.credential(email: userEmail, password: oldPassword);
        await _auth.currentUser!.reauthenticateWithCredential(_credential);
        await 
        _auth.currentUser!.updatePassword(newPassword);
        if(isStudent) {
          await FirebaseFunctions().updateStudentPassword(newPassword, userID);
        }
        else {
          await FirebaseFunctions().updateTeacherPassword(newPassword, userID);
        }
      }
      else {
        print('Please Check Your Fields. Not Matching!');
      }
    }
    else {
      print('PLease fill textFields to change your password');
    }
  }
  Future resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
  }
}


