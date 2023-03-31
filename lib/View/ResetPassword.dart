import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minerva/Control/FirebaseFunctions.dart';
import 'package:minerva/Control/SharedFunctions.dart';
import 'package:minerva/Model/WidgetProperties.dart';
import '../Model/CustomWidgets.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final oldPasswordController = TextEditingController();
  final _user = FirebaseAuth.instance;
  String userID = '';
  String userEmail = '';
  bool isStudent = false;

  _getUserData() async {
    var val = await SharedFunctions.getUserEmailSharedPreference();
    setState(() {
      userEmail = val!;
    });
    var isOK = await SharedFunctions.getUserStudentSharedPreference();
    if(isOK!) {
      var user = await FirebaseFunctions().getStudentData(userEmail);
      setState(() {
        userID = user.docs[0].get('studentID');
        setState(() {
          isStudent = isOK;
        });
      });
    }
    else {
      var user = await FirebaseFunctions().getTeacherData(userEmail);
      setState(() {
        userID = user.docs[0].get('teacherID');
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('RESET PASSWORD', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        elevation: 0.0,
        automaticallyImplyLeading: true,
        backgroundColor: PageColors.mainColor,
      ),
      drawer: customDrawer(),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: height * 0.10),
          child: Column(
            children: <Widget>[
              Image.asset('assets/logo.png', width: 200, height: 200),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                  controller: oldPasswordController,
                  textAlign: TextAlign.center,
                  obscureText: true,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.password_sharp),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2,
                              color: Color.fromRGBO(28, 88, 140, 1))),
                      labelText: 'Old Password',
                      labelStyle: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                      )),
                ),
              ),
              SizedBox(height: 20.0),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                  controller: passwordController,
                  textAlign: TextAlign.center,
                  obscureText: true,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.password_sharp),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2,
                              color: Color.fromRGBO(28, 88, 140, 1))),
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                      )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                  controller: confirmPasswordController,
                  textAlign: TextAlign.center,
                  obscureText: true,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.password_sharp),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2,
                              color: Color.fromRGBO(28, 88, 140, 1))),
                      labelText: 'Confirm Password',
                      labelStyle: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                      )),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 3),
                  decoration: BoxDecoration(
                    color: PageColors.mainColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextButton(
                    onPressed: () {
                      passCheck(oldPasswordController.text, passwordController.text, confirmPasswordController.text);
                    },
                    child: Text(
                      'Change Password',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future passCheck(String oldPassword, String newPassword, String safeNewPassword) async {
    if (newPassword.isNotEmpty && safeNewPassword.isNotEmpty) {
      if (newPassword == safeNewPassword) {
        print("Passwords are succesfully matched");
        final _credential = EmailAuthProvider.credential(email: userEmail, password: oldPassword);
        await _user.currentUser!.reauthenticateWithCredential(_credential);
        await _user.currentUser!.updatePassword(newPassword);
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
}
