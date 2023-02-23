import 'package:flutter/material.dart';
import 'package:minerva/Model/CustomWidgets.dart';
import 'package:minerva/Model/ColorPlates.dart';

class ContentStudent extends StatefulWidget {
  @override
  State<ContentStudent> createState() => _ContentStudentState();
}

class _ContentStudentState extends State<ContentStudent> {
  // final Color mainColor = Color.fromRGBO(28, 88, 140, 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //   backgroundColor: Colors.deepOrange[300],
        appBar: AppBar(
          elevation: 0.0,
          automaticallyImplyLeading: true,
          backgroundColor: PageColors.mainColor,
          centerTitle: true,
          title: Text("MATERIALS",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        ),
        body: Container(
          alignment: Alignment.center,
          child: ListView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            children: [
              SizedBox(height: 15.0),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                child: ListTile(
                  leading: Icon(Icons.class_),
                  title: Text("Math",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                  onTap: () {},
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                child: ListTile(
                  leading: Icon(Icons.class_),
                  title: Text(
                    "Chemistry",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                child: ListTile(
                  leading: Icon(Icons.class_),
                  title: Text(
                    "Physics",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                child: ListTile(
                  leading: Icon(Icons.class_),
                  title: Text(
                    "History",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                child: ListTile(
                  leading: Icon(Icons.class_),
                  title: Text(
                    "Biology",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                child: ListTile(
                  leading: Icon(Icons.class_),
                  title: Text(
                    "Turkish",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                child: ListTile(
                  leading: Icon(Icons.class_),
                  title: Text(
                    "English",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                child: ListTile(
                  leading: Icon(Icons.class_),
                  title: Text(
                    "German",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                child: ListTile(
                  leading: Icon(Icons.class_),
                  title: Text(
                    "Literature",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        drawer: customDrawer());
  }
}
