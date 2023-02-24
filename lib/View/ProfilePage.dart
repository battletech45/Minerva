import 'package:flutter/material.dart';
import 'package:minerva/Model/CustomWidgets.dart';

import '../Model/ColorPlates.dart';

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
                CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 55,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Bertan Silleli",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "11-A",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "20180601036",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            SizedBox(
              height: 23,
            ),
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
                          children: [
                            Icon(Icons.person_2),
                            Text(
                              "Name Surname",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              width: 14,
                            ),
                            Text(
                              "Bertan Silleli",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                        margin:
                            EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                        child: Container(
                          height: 65,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.numbers_rounded),
                              Text(
                                "Student Number",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: 14,
                              ),
                              Text(
                                "2010601001",
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
                            children: [
                              Icon(Icons.cabin_rounded),
                              Text(
                                "Class",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: 14,
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
                            children: [
                              Icon(Icons.school_rounded),
                              Text(
                                "School",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: 14,
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
                            children: [
                              Icon(Icons.email_rounded),
                              Text(
                                "Email",
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "student@example.com",
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(Icons.password_rounded),
                              Text(
                                "Password",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: 14,
                              ),
                              Text(
                                "*************",
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(Icons.password_rounded),
                              Text(
                                "Password",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: 14,
                              ),
                              Text(
                                "*************",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        )),
                  ]),
            ),
          ]),
        ),
        drawer: customDrawer());
  }
}
