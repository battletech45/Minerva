import 'package:flutter/material.dart';
import 'package:minerva/View/ForgotPassword.dart';
import '../Controller/AuthService.dart';
import '../Controller/Validators.dart';
import 'WelcomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final schoolNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
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
        child: Form(
          key: formKey,
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
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: schoolNumberController,
                  validator: Validators.checkEmail,
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
                    labelText: 'Email',
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
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: passwordController,
                  validator: Validators.validatePassword,
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
                    color: Color.fromRGBO(28, 88, 140, 1),
                    borderRadius: BorderRadius.circular(10)),
                child: TextButton(
                  onPressed: () async {
                    AuthServices().signInWithEmailAndPassword(
                        schoolNumberController.text, passwordController.text, context, formKey);
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
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => ForgotPassword()));
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      'Forgot Password',
                      style: TextStyle(color: Colors.black, fontSize: 20),
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
      ),
    );
  }
/*
  Future signIn() async {
    if (formKey.currentState!.validate()) {
      var studentData =
          await FirebaseFunctions().getStudentData(schoolNumberController.text);
      try {
        await authLog.signInWithEmailAndPassword(
          email: schoolNumberController.text.trim(),
          password: passwordController.text.trim(),
        );
        if (studentData.docs.isNotEmpty) {
          await SharedFunctions.saveUserLoggedInSharedPreference(true);
          await SharedFunctions.saveUserStudentSharedPreference(true);
          await SharedFunctions.saveUserEmailSharedPreference(
              schoolNumberController.text);
          await SharedFunctions.saveUserNameSharedPreference(
              studentData.docs[0].get('studentName'));
          if (studentData.docs[0].get('password') != passwordController.text) {
            await FirebaseFunctions().updateStudentPassword(
                passwordController.text, studentData.docs[0].get('studentID'));
          }
        } else {
          var teacherData = await FirebaseFunctions()
              .getTeacherData(schoolNumberController.text);
          await SharedFunctions.saveUserStudentSharedPreference(false);
          await SharedFunctions.saveUserLoggedInSharedPreference(true);
          await SharedFunctions.saveUserEmailSharedPreference(
              schoolNumberController.text);
          await SharedFunctions.saveUserNameSharedPreference(
              teacherData.docs[0].get('teacherName'));
          if (teacherData.docs[0].get('password') != passwordController.text) {
            await FirebaseFunctions().updateStudentPassword(
                passwordController.text, teacherData.docs[0].get('teacherID'));
          }
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    }
  } */
}
