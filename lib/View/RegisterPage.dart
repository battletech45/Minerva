import 'package:flutter/material.dart';
import 'package:minerva/Model/WidgetProperties.dart';
import '../Control/FirebaseFunctions.dart';
import 'ProfilePage.dart';
import 'WelcomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPage createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
 final passwordController= TextEditingController();
 final emailController= TextEditingController();
 final registrationNumberController= TextEditingController();
 final TCController= TextEditingController();
 final schoolNumberController= TextEditingController();
 FirebaseAuth authReg = FirebaseAuth.instance;

 Future register () async {
   try {
     UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
       email: emailController.text.trim(),
       password: passwordController.text.trim(),
     );
     User? user = userCredential.user;
     print(user!.uid);
     await FirebaseFunctions(userID: user!.uid).createStudent('test', passwordController.text, emailController.text,TCController.text,schoolNumberController.text);
     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> ProfilePage()));
   } on FirebaseAuthException catch (e) {
     if (e.code == 'weak-password') {
       print('The password provided is too weak.');
     } else if (e.code == 'email-already-in-use') {
       print('The account already exists for that email.');
     }
   } catch (e) {
     print(e);
   }
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_sharp),
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> MainPage()));
          },
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: PageColors.mainColor,
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
          children: <Widget>[
            Image.asset(
              'assets/logo.png',
              width:120 ,
              height:120 ,
            ),
             SizedBox(
              width:  MediaQuery.of(context).size.width*0.9,
              child: TextField(
                controller: TCController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.perm_identity),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2, color: Color.fromRGBO(28, 88, 140, 1))),
                      labelText: 'TC',
                      labelStyle: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                      ))),
            ),
            SizedBox(height: 20.0),
            SizedBox( 
              width:  MediaQuery.of(context).size.width*0.9,
              child: TextField(
                  controller: schoolNumberController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.school),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2, color: Color.fromRGBO(28, 88, 140, 1))),
                      labelText: 'School Number',
                      labelStyle: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                      ))),
            ),
            SizedBox(height: 20.0),
            SizedBox(
              width:  MediaQuery.of(context).size.width*0.9,
              child: TextField(
                  controller: emailController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.email_outlined),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2, color: Color.fromRGBO(28, 88, 140, 1))),
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                      ))),
            ),
            SizedBox(height: 20.0),
            SizedBox(
               width:  MediaQuery.of(context).size.width*0.9,
              child: TextField(
                obscureText: true,
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
                              width: 2, color: Color.fromRGBO(28, 88, 140, 1))),
                      labelText: 'Password',

                      labelStyle: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                      ))),
            ),
            SizedBox(height: 20.0),
            SizedBox(
               width:  MediaQuery.of(context).size.width*0.9,
              child: TextField(
                  controller: registrationNumberController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.app_registration),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2, color: Color.fromRGBO(28, 88, 140, 1))),
                      labelText: 'Registration Number',
                      labelStyle: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                      ))),
            ),
            SizedBox(height: 20.0),
            Container(
              height:MediaQuery.of(context).size.width*0.13,
              width:  MediaQuery.of(context).size.width*0.5,
              decoration: BoxDecoration(
              color: PageColors.mainColor, borderRadius: BorderRadius.circular(10)),

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
    );
  }
}


