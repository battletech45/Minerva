import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minerva/Controller/AuthService.dart';
import 'package:minerva/Model/WidgetProperties.dart';
import 'package:minerva/View/LoginPage.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final emailController = TextEditingController();
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: PageColors.mainColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_sharp),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => LoginPage()));
          },
        ),
        title: Text(
          'Forgot Password'.toUpperCase(),
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: height * 0.05),
            height: height * 0.85,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50))),
            child: ListView(
              children: <Widget>[
                Container(
                    width: 200,
                    height: 200,
                    child: Image.asset(
                      'assets/logo.png',
                      scale: 0.1,
                    )),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: TextField(
                        controller: emailController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            suffixIcon: Icon(Icons.email_outlined),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2,
                                    color: Color.fromRGBO(28, 88, 140, 1))),
                            labelText: 'Email',
                            labelStyle: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.black,
                            ))),
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
                        if(emailController.text.isNotEmpty) {
                          AuthServices().resetPassword(emailController.text);
                          setState(() {
                            isVisible = true;
                          });
                        }
                      },
                      child: Text(
                        'Send Link',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.0),
                Visibility(
                    visible: isVisible,
                    child: Text('Please check your email box !', textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 20))
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
