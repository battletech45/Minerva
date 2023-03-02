import 'package:flutter/material.dart';
import 'package:minerva/Model/WidgetProperties.dart';
import 'package:minerva/View/LoginPage.dart';
import '../Model/CustomWidgets.dart';



class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();

}

class _ResetPasswordState extends State<ResetPassword> {

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

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
          'Reset Password'.toUpperCase(),
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
              children: [
                Container(
                    width: 200,
                    height: 200,
                    child: Image.asset(
                      'assets/logo.png',
                      scale: 0.1,
                    )
                ),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                  child:
                  SizedBox(
                    width:  MediaQuery.of(context).size.width*0.9,
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
                ),

                SizedBox(height: 10,),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                  child:
                  SizedBox(
                    width:  MediaQuery.of(context).size.width*0.9,
                    child: TextField(
                      controller: confirmPasswordController,
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
                          labelText: 'Confirm Password',
                          labelStyle: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.black,
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Center(
                  child: Container(
                    padding:
                    EdgeInsets.symmetric(horizontal: 30, vertical: 3),
                    decoration: BoxDecoration(
                      // Gradient neden var (altayla bakilacak - Bertan)
                      color: PageColors.mainColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      onPressed: () { passCheck(); },
                      child: Text(
                        'Change Password',
                        style: TextStyle(
                            color: Colors.white,fontSize: 20
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
  void passCheck () {
    // Fieldlar boş olunca da doğru diyor. Önce Fieldların dolu olup olmadığına bakıp(eğer boşsa hata dönmeliyiz), doluysa karşılaştırma yapmalıyız
    if (passwordController.text.trim()!= confirmPasswordController.text.trim()) {
      print("Password does not match");
    }
      else {
        print("Passwords are succesfully matched");
    }
  }

}