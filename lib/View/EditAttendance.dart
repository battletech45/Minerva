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
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(border:Border(bottom: BorderSide(color: PageColors.secondaryColor,width:2))),
                child: customEditExpansionPanel(name: students[index])
              );
            }),
      ),
      drawer: customDrawer(),
    );
  }
}
