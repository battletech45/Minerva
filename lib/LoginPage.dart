import 'package:flutter/material.dart';

class LoginDemo extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[300],
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.deepOrange[300],
        title: Text("Sign in Page"),
      ),
      body: SingleChildScrollView(
        child: Column(
            children: <Widget>[
        Padding(
        padding: const EdgeInsets.only(top: 60.0),
        child: Center(
          child: Container(
              width: 200,
              height: 200,
              child: Image.asset(
                'assets/images/logo.png',
                scale: 0.1,
              )),
        ),
      ),
      const Padding(
        //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: TextField(
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(50), right: Radius.circular(50),)
            ),
            labelText: 'School Number',
            labelStyle: TextStyle(
              fontStyle: FontStyle.italic,
              color: Colors.black,

            ),
          ),
        ),
      ),
      const Padding(
        padding:
        EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 15),
        //padding: EdgeInsets.symmetric(horizontal: 15),
        child: TextField(
          textAlign: TextAlign.center,
          obscureText: true,
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(50), right: Radius.circular(50),)
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
        width: 250,
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(50)),
        child: TextButton(
          onPressed: () {},
          child: const Text(
            'Sign in',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
      ),
      TextButton(
        onPressed: () {},
        child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
            Text('Forgot Password',
                style:TextStyle(
                  color: Colors.white60,
                ) ),

              SizedBox(
                width: 5,
              ),
              Icon(Icons.question_mark,
                color: Colors.yellowAccent ),
        ],
      ),

    ),]
    ,
    )
    ,
    )
    ,
    );
  }
}