import 'package:flutter/material.dart';
import 'package:minerva/Control/FirebaseFunctions.dart';
import 'package:minerva/Control/SharedFunctions.dart';
import 'package:minerva/View/ForgotPassword.dart';
import 'ProfilePage.dart';
import 'WelcomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';



class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final schoolNumberController = TextEditingController();
  final passwordController = TextEditingController();
  FirebaseAuth authLog = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Color.fromRGBO(28, 88, 140, 1),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_sharp),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => MainPage()));
            },
          )),
      body: Center(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 80.0),
            children: <Widget>[
              Container(
                width: 300,
                height: 200,
                child: Image.asset(
                  'assets/logo.png',
                  //scale: 0.1,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                  controller: schoolNumberController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.school),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2, color: Color.fromRGBO(28, 88, 140, 1))),
                    labelText: 'School Number',
                    labelStyle: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25.0),
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
                              width: 2, color: Color.fromRGBO(28, 88, 140, 1))),
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                      )),
                ),
              ),
              SizedBox(height: 25.0),
              Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(28, 88, 140, 1), borderRadius: BorderRadius.circular(10)),
                child: TextButton(
                  onPressed: () {
                    signIn();
                  },
                  child: const Text(
                    'Sign in',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(

                onPressed: () {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> ForgotPassword()));},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      'Forgot Password',
                      style: TextStyle(
                        color: Colors.black,fontSize: 20
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(Icons.question_mark,
                        color: Color.fromRGBO(28, 88, 140, 1)),
                  ],
                ),
              ),
            ],
        ),
      ),
    );
  }
  Future signIn() async {
    var data = await FirebaseFunctions().getStudentData(schoolNumberController.text);
    try {
      await authLog.signInWithEmailAndPassword(
          email:schoolNumberController.text.trim(),
          password:passwordController.text.trim(),
      );
      await SharedFunctions.saveUserEmailSharedPreference(schoolNumberController.text);
      await SharedFunctions.saveUserNameSharedPreference(data.docs[0].get('studentName'));
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> ProfilePage()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }

  }
}


