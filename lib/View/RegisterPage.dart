import 'package:flutter/material.dart';
import 'ProfilePage.dart';
import 'WelcomePage.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[300],
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_sharp),
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> MainPage()));
          },
        ),
        elevation: 0,
        backgroundColor: Colors.deepOrange[300],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset(
              'assets/logo.png',
              width: 200,
              height: 200,
            ),
             SizedBox(
              width:  MediaQuery.of(context).size.width*0.9,
              child: TextField(
                controller: TCController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      labelText: 'TC',
                      labelStyle: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                      ))),
            ),
            SizedBox( 
              width:  MediaQuery.of(context).size.width*0.9,
              child: TextField(
                  controller: schoolNumberController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      labelText: 'School Number',
                      labelStyle: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                      ))),
            ),
            SizedBox(
              width:  MediaQuery.of(context).size.width*0.9,
              child: TextField(
                  controller: emailController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                      ))),
            ),
            SizedBox(
               width:  MediaQuery.of(context).size.width*0.9,
              child: TextField(
                  controller: passwordController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                      ))),
            ),
            SizedBox(
               width:  MediaQuery.of(context).size.width*0.9,
              child: TextField(
                  controller: registrationNumberController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      labelText: 'Registration Number',
                      labelStyle: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                      ))),
            ),
            Container(
             height:MediaQuery.of(context).size.width*0.13,
              width:  MediaQuery.of(context).size.width*0.35,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(10)),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> ProfilePage()));
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
