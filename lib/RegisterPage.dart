import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPage createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[300],
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.deepOrange[300],
        title: Text('Register Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: Center(
                child: Container(
                  width: 200,
                  height: 200,
                  child: Image.asset(
                    'assets/images/logo.png',
                    scale: 0.1,
                  ),
                ),
              ),
            ),
            const Padding(
                padding: EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 1, bottom: 5),
                child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(50),
                          right: Radius.circular(50),
                        )),
                        labelText: 'TC',
                        labelStyle: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                        )))),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(50),
                          right: Radius.circular(50),
                        )),
                        labelText: 'School Number',
                        labelStyle: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                        )))),
            const Padding(
                padding: EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 5, bottom: 5),
                child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(50),
                          right: Radius.circular(50),
                        )),
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                        )))),
            const Padding(
                padding: EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 5, bottom: 5),
                child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(50),
                          right: Radius.circular(50),
                        )),
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                        )))),
            const Padding(
                padding: EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 5, bottom: 5),
                child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(50),
                          right: Radius.circular(50),
                        )),
                        labelText: 'Registration Number',
                        labelStyle: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                        )))),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(50)),
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'register',
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
