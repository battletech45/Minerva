// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:minerva/Model/CustomWidgets.dart';
import 'package:flutter/material.dart';

class TeacherGradePage extends StatefulWidget {
  const TeacherGradePage({Key? key}) : super(key: key);

  @override
  State<TeacherGradePage> createState() => _TeacherGradePageState();
}

class _TeacherGradePageState extends State<TeacherGradePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Grades',
          style: TextStyle(color: Colors.black),
        ),
        toolbarHeight: 100.0,
        elevation: 0.0,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.deepOrange[300],
        actions: <Widget>[
          Image.asset('assets/logo.png',
              alignment: Alignment.centerRight, height: 150, width: 150),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide()),
            color: Colors.deepOrange[300]),
        child: ListView(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(border: Border(bottom: BorderSide())),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(width: 20),
                ),
                leading: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.grade_sharp),
                ),
                title: Row(
                  children: <Widget>[
                    Text(
                      'Homework1',
                      style: TextStyle(fontSize: 24),
                      textAlign: TextAlign.start,
                    ),
                    Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: TextFormField(
                            style: TextStyle(fontSize: 22),
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 2.0,
                                ),
                              ),
                              labelText: ('Score'),
                              labelStyle:
                              TextStyle(color: Colors.grey, fontSize: 24),
                            ),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 1.0),
                      child: IconButton(icon: Icon(Icons.check_circle,size: 40,color: Colors.green,), onPressed: () {}),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(border: Border(bottom: BorderSide())),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(width: 20),
                ),
                leading: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.grade_sharp),
                ),
                title: Row(
                  children: <Widget>[
                    Text(
                      'Homework2',
                      style: TextStyle(fontSize: 24),
                      textAlign: TextAlign.start,
                    ),
                    Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: TextFormField(
                            style: TextStyle(fontSize: 22),
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 2.0,
                                ),
                              ),
                              labelText: ('Score'),
                              labelStyle:
                              TextStyle(color: Colors.grey, fontSize: 24),
                            ),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 1.0),
                      child: IconButton(icon: Icon(Icons.check_circle,size: 40,color: Colors.green,), onPressed: () {}),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(border: Border(bottom: BorderSide())),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(width: 20),
                ),
                leading: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.grade_sharp),
                ),
                title: Row(
                  children: <Widget>[
                    Text(
                      'Exam',
                      style: TextStyle(fontSize: 24),
                      textAlign: TextAlign.start,
                    ),
                    Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 85.0),
                          child: TextFormField(
                            style: TextStyle(fontSize: 22),
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 2.0,
                                ),
                              ),
                              labelText: ('Score'),
                              labelStyle:
                              TextStyle(color: Colors.grey, fontSize: 24),
                            ),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 1.0),
                      child: IconButton(icon: Icon(Icons.check_circle,size: 40,color: Colors.green,), onPressed: () {}),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(border: Border(bottom: BorderSide())),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(width: 20),
                ),
                leading: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.grade_sharp),
                ),
                title: Row(
                  children: <Widget>[
                    Text(
                      'Project',
                      style: TextStyle(fontSize: 24),
                      textAlign: TextAlign.start,
                    ),
                    Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 65.0),
                          child: TextFormField(
                            style: TextStyle(fontSize: 22),
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 2.0,
                                ),
                              ),
                              labelText: ('Score'),
                              labelStyle:
                              TextStyle(color: Colors.grey, fontSize: 24),
                            ),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 1.0),
                      child: IconButton(icon: Icon(Icons.check_circle,size: 40,color: Colors.green,), onPressed: () {}),
                    ),

                  ],

                ),
              ),
            ),
          ],
        ),
      ),
      drawer: customDrawer(),
    );
  }
}
