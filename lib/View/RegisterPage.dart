import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:minerva/Control/Validators.dart';
import 'package:minerva/Model/WidgetProperties.dart';
import '../Control/FirebaseFunctions.dart';
import '../Control/SharedFunctions.dart';
import 'StudentView/ProfileView/ProfilePage.dart';
import 'TeacherView/ProfileView/ProfileTeacher.dart';
import 'WelcomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPage createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {

  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final registrationNumberController = TextEditingController();
  final TCController = TextEditingController();
  final schoolNumberController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isStudent = false;
  List<String> tokens = [];

  Future register() async {
    if(formKey.currentState!.validate()) {}
   formKey.currentState!.save();
    try {
      if(registrationNumberController.text.isNotEmpty) {
        print('here2');
        if(tokens.contains(registrationNumberController.text)) {
          print("here");
          if(registrationNumberController.text == tokens[0]) {
            setState(() {
              isStudent = true;
            });
            UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim(),
            );
            User? user = userCredential.user;
            print(user!.uid);
            await FirebaseFunctions(userID: user.uid).createStudent(
                'test',
                passwordController.text,
                emailController.text,
                TCController.text,
                schoolNumberController.text,
                registrationNumberController.text
            );
            var data = await FirebaseFunctions().getStudentData(emailController.text);
            await SharedFunctions.saveUserEmailSharedPreference(emailController.text);
            await SharedFunctions.saveUserStudentSharedPreference(isStudent);
            await SharedFunctions.saveUserNameSharedPreference(
                data.docs[0].get('studentName'));
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => ProfilePage()));
          }
          if(registrationNumberController.text == tokens[1]) {
            UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim(),
            );
            User? user = userCredential.user;
            print(user!.uid);
            await FirebaseFunctions(userID: user.uid).createTeacher(
                'test',
                passwordController.text,
                emailController.text,
                TCController.text,
                schoolNumberController.text,
                registrationNumberController.text
            );
            var data = await FirebaseFunctions().getTeacherData(emailController.text);
            await SharedFunctions.saveUserEmailSharedPreference(emailController.text);
            await SharedFunctions.saveUserStudentSharedPreference(isStudent);
            await SharedFunctions.saveUserNameSharedPreference(
                data.docs[0].get('teacherName'));
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => ProfileTeacherPage()));
          }
        }
        else {print('token not matched');}
      }
      else {print('register number cannot be empty');}
    } catch (e) {
      print(e);
    }
  }

  storeTokens() async {
    var val = await FirebaseFunctions().getTokens();
    tokens = val;
    print(tokens[0]);
    print(tokens[1]);
  }

  @override
  void initState() {
    super.initState();
    storeTokens();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_sharp),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => MainPage()));
          },
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: PageColors.mainColor,
      ),
      body: Center(
        child: Form(
          
          key: formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
            children: <Widget>[
              Image.asset(
                'assets/logo.png',
                width: 120,
                height: 120,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextFormField(
                   autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: TCController,
                     validator: Validators.checkTC,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        suffixIcon: Icon(Icons.perm_identity),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2, color: PageColors.mainColor)),
                        labelText: 'TC',
                        labelStyle: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                        ))),
              ),
              SizedBox(height: 20.0),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextFormField(
                   autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: schoolNumberController,
                     validator: Validators.checkEmptyFields,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        suffixIcon: Icon(Icons.school),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2, color: PageColors.mainColor)),
                        labelText: 'School Number',
                        labelStyle: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                        ))),
              ),
              SizedBox(height: 20.0),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextFormField(
                   autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: emailController,
                    validator: Validators.checkEmail,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        suffixIcon: Icon(Icons.email_outlined),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2, color: PageColors.mainColor)),
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                        ))),
              ),
              SizedBox(height: 20.0),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextFormField(
                   autovalidateMode: AutovalidateMode.onUserInteraction,
                    obscureText: true,
                    validator: Validators.validatePassword,
                    controller: passwordController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        suffixIcon: Icon(Icons.password),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2, color: PageColors.mainColor)),
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                        ))),
              ),
              SizedBox(height: 20.0),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextFormField(
                   autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: registrationNumberController,
                     validator: Validators.checkEmptyFields,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        suffixIcon: Icon(Icons.app_registration),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2, color: PageColors.mainColor)),
                        labelText: 'Registration Number',
                        labelStyle: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                        ))),
              ),
              SizedBox(height: 20.0),
              Container(
                height: MediaQuery.of(context).size.width * 0.13,
                width: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                    color: PageColors.mainColor,
                    borderRadius: BorderRadius.circular(10)),
                child: TextButton(
                  onPressed: () {
                    register();
                  },
                  child: const Text(
                    'Register',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
