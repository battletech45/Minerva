import 'package:firebase_storage/firebase_storage.dart';
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
  String userName = "";
  String email = "";
  String link = '';
  bool isLoading = false;
  Image? photo;

  _getUserData() async {
    var val = await SharedFunctions.getUserEmailSharedPreference();
    setState(() {
      email = val!;
    });
    var user = await FirebaseFunctions().getStudentData(email);
    setState(() {
      userName = user.docs[0].get('studentName');
     
    });
  }
  _getImaage() async {
    setState(() {
      isLoading = true;
    });
    final ref = await FirebaseStorage.instance.ref('sampleFile').child('images.jpeg');
    link = await ref.getDownloadURL();
    setState(() {
      photo = Image.network('http://' + link);
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
   _getUserData();
   _getImaage();
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
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: <Widget>[
                SizedBox(height: 10),
                isLoading ? CircularProgressIndicator() : customContentFeed(userName: 'Yarkın Ata', content: 'Hello world Yarkin Metin Altay'),
                SizedBox(height: 30),
                //customContentFeed(userName: 'Yarkın Ata'),
                SizedBox(height: 30),
                //customContentFeed(userName: 'Yarkın Ata'),
                SizedBox(height: 30),
                //customContentFeed(userName: 'Yarkın Ata'),
              ],
            ),
          ),
        ),
        drawer: customDrawer(),
    );
  }
}
