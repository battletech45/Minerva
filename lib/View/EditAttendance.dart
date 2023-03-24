import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Model/CustomWidgets.dart';
import '../Model/WidgetProperties.dart';

class EditAttendance extends StatefulWidget {
  const EditAttendance({super.key});

  @override
  State<EditAttendance> createState() => _EditAttendanceState();
}

class _EditAttendanceState extends State<EditAttendance> {
  final searchController = TextEditingController();
  bool isSelected = false;
  bool expansionIcon = false;
  List students = [
    "ALTAY",
    "YARKIN",
    "BERTAN",
    "METİN",
    "ATAKAN",
    "BEYZA",
    "YAĞMUR",
    "ECE",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: true,
        backgroundColor: PageColors.mainColor,
        centerTitle: true,
        title: Text("Edit Attendance",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: students.length,
          itemBuilder: (context, index){ return ExpansionTile(
            title: Text(students[index],style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black,
              letterSpacing: 0.5),),
            trailing: Icon(
                expansionIcon
                    ? FontAwesomeIcons.sortUp
                    : FontAwesomeIcons.sortDown,
                color: Colors.pink),
            children: <Widget>[
          
              customEditCheckBoxListTile(hours: "One Hour"),
              customEditCheckBoxListTile(hours: "Two Hour"),
             customEditCheckBoxListTile(hours: "Three Hour"),
            ],
            onExpansionChanged: (bool expanded) {
              setState(() {
                expansionIcon = expanded;
              });
            },
          );
          }
        ),
      ),
      drawer: customDrawer(),
    );
  }
}
