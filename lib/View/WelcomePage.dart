import 'package:flutter/material.dart';
import 'package:minerva/Model/WidgetProperties.dart';
import 'LoginPage.dart';
import 'RegisterPage.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(top: 110.0),
                child: Center(
                    child: Container(
                        width: 300,
                        height: 300,
                        child: Image.asset(
                          'assets/logo.png',
                          scale: 0.1,
                        )
                    )
                )
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: PageColors.mainColor, borderRadius: BorderRadius.circular(10)),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> RegisterPage()));
                },
                child: const Text(
                  'Register',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            const Padding(
                padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 15),
                ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: PageColors.mainColor, borderRadius: BorderRadius.circular(10)),
              child: TextButton(

                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> LoginPage()));
                },
                child: const Text(
                  'Sign in',
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
