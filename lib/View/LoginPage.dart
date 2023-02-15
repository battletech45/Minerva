import 'package:flutter/material.dart';

import 'WelcomePage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final schoolNumberController =TextEditingController();  
  final passwordController =TextEditingController();  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[300],
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.deepOrange[300],
        leading: IconButton(icon: Icon(Icons.arrow_back_sharp),
        onPressed: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> MainPage()));
        },)
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                width: MediaQuery.of(context).size.width*0.9,
                child: TextField(
                    controller: schoolNumberController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      labelText: 'School Number',
                      labelStyle: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                      ),
                    ),
                    ),
              ),
      
           SizedBox(
            width: MediaQuery.of(context).size.width*0.9,
            child: TextField(
            controller: passwordController,
            textAlign: TextAlign.center,
            obscureText: true,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                labelText: 'Password',
                labelStyle: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.black,
                )
            ),
                  ),
          ),
        
        Container(
        height: 50,
        width: 150,
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(10)),
        child: TextButton(
          onPressed: () {},
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
        onPressed: () {},
        child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
            Text('Forgot Password',
                style:TextStyle(
                color: Colors.white70,
                ) ,
                ),
              SizedBox(
                width: 5,
              ),
              Icon(Icons.question_mark,
                color: Colors.yellowAccent ),
        ],
        ),
      
          ),]
          ,
          ),
      )
    ,
    );
  }
}