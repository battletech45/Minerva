import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import '../../../Model/CustomWidgets.dart';
import '../../../Model/WidgetProperties.dart';

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
 final List<String> classes = [
  '11-A',
  '10-D',
  '12-A',
  '11-B',
  '12-C',
];
String? selectedValue;

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
      body: Column(
        children: [
          SizedBox(height: 15),
          DropdownButtonHideUnderline(
        child: DropdownButton2(
          hint: Text(
            'Select Class',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Theme.of(context).hintColor,
            ),
          ),
          items: classes
                  .map((item) => DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                
              ),
            ),
          ))
                  .toList(),
          value: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value as String;
            });
          },
          buttonStyleData: const ButtonStyleData(
            height: 40,
            width: 200,
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 50,
          ),
        ),
      ),
          Expanded(
            child: Container(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                  itemCount: students.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(border:Border(bottom: BorderSide(color: PageColors.secondaryColor,width:2))),
                      child: customEditExpansionPanel(name: students[index])
                    );
                  }),
            ),
          ),
        ],
      ),
      drawer: customDrawer(),
    );
  }
}
