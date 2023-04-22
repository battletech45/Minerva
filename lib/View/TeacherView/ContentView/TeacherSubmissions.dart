import 'package:flutter/material.dart';

import '../../../Model/WidgetProperties.dart';

class TeacherSubmissions extends StatefulWidget {
  const TeacherSubmissions({Key? key}) : super(key: key);

  @override
  State<TeacherSubmissions> createState() => _TeacherSubmissionsState();
}

class _TeacherSubmissionsState extends State<TeacherSubmissions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/logo.png', width: 300, height: 300),
            Text('There is no submission yet !', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0, fontStyle: FontStyle.italic, color: PageColors.thirdColor))
          ],
        ),
      ),
    );
  }
}
