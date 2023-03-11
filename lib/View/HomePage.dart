import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:minerva/Model/WidgetProperties.dart';
import '../Control/FirebaseFunctions.dart';
import '../Control/SharedFunctions.dart';
import '../Model/CustomWidgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  bool click = false;
  String userName="";
  String email="";

  _getUserData() async {
    var val = await SharedFunctions.getUserEmailSharedPreference();
    setState(() {
      email = val!;
    });
    print(email);
    var user = await FirebaseFunctions().getStudentData(email);
    setState(() {
      userName = user.docs[0].get('studentName');
     
    });
  }
  @override void initState() {
   _getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          automaticallyImplyLeading: true,
          backgroundColor: PageColors.mainColor,
          centerTitle: true,
          title: Text("HOME", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        ),
        body: Center(
          child: ListView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            children: <Widget> [
                SizedBox(height: 10),
                // Likeler yukarı veya aşağı kaydırılınca kayboluyor
                customContentFeed(userName: 'Yarkın Ata'),
                SizedBox(height: 30),
                customContentFeed(userName: 'Yarkın Ata'),
                SizedBox(height: 30),
                customContentFeed(userName: 'Yarkın Ata'),
                SizedBox(height: 30),
                customContentFeed(userName: 'Yarkın Ata'),
            ],
          ),
        ),
        drawer: customDrawer(),
    );
  }
}
