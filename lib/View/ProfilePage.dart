import 'package:flutter/material.dart';
import 'package:minerva/Model/CustomWidgets.dart';

import '../Model/WidgetProperties.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          automaticallyImplyLeading: true,
          backgroundColor: PageColors.mainColor,
          centerTitle: true,
          title: Text("PROFILE", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
              children: <Widget>[
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(backgroundColor: Colors.black, radius: 55.0, child: Icon(Icons.person, size: 50.0)),
              ],
            ),
            SizedBox(height: 10.0),
            Text("Bertan Silleli", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("11-A", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400)),
                SizedBox(width: 15.0),
                Text("20180601036", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400)),
              ],
            ),
            SizedBox(height: 23.0),
            Expanded(
              child: ListView(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  children: <Widget>[
                    Card(
                      margin: EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                      child: Container(
                        height: 65,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Icon(Icons.person_2),
                                SizedBox(width: 20.0),
                                Text("Name Surname", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                              ],
                            ),
                            Text("Bertan Silleli", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                          ],
                        ),
                      ),
                    ),
                    Card(
                        margin: EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                        child: Container(
                          height: 65,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Icon(Icons.numbers_rounded),
                                  SizedBox(width: 20.0),
                                  Text("Student Number", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                                ],
                              ),
                              Text("2010601001", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                            ],
                          ),
                        )),
                    Card(
                        margin:
                            EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                        child: Container(
                          height: 65,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Icon(Icons.cabin_rounded),
                                  SizedBox(width: 20.0),
                                  Text("Class",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                                ],
                              ),
                              Text(
                                "11-A",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        )),
                    Card(
                        margin:
                            EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                        child: Container(
                          height: 65,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Icon(Icons.school_rounded),
                                  SizedBox(width: 20.0),
                                  Text("School", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                                ],
                              ),
                              Text(
                                "Yunus Emre Anadolu Lisesi",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        )),
                    Card(
                        margin:
                            EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                        child: Container(
                          height: 65,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Icon(Icons.email_rounded),
                                  SizedBox(width: 20.0),
                                  Text("Email",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                                ],
                              ),
                              Text(
                                "student@example.com",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        )
                    ),
                  ]),
            ),
          ]),
        ),
        drawer: customDrawer());
  }
}
