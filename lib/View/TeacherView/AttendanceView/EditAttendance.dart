import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:minerva/Control/FirebaseFunctions.dart';
import '../../../Model/CustomWidgets.dart';
import '../../../Model/WidgetProperties.dart';

class EditAttendance extends StatefulWidget {
  const EditAttendance({super.key});

  @override
  State<EditAttendance> createState() => _EditAttendanceState();
}

class _EditAttendanceState extends State<EditAttendance> {
  TextEditingController searchController = TextEditingController();
  bool expansionIcon = false;
  List students = [];
  List<String> classes = [];
  String? selectedValue;

  _getClasses() async {
    var val = await FirebaseFunctions().getAllClasses();
    var size = val.size;
    for(int i = 0; i < size; i++) {
      setState(() {
        classes.add(val.docs[i].get('className'));
      });
    }
  }

  _getStudents(String className) async {
    var val = await FirebaseFunctions().getClassData(className);
    List<dynamic> studentList = val.docs[0].get('students');
    for(int i = 0; i < studentList.length; i++) {
      var name = await FirebaseFunctions().getStudentDataViaID(studentList[i]);
      setState(() {
        students.add(name.docs[0].get('studentName'));
      });
      print(students[i]);
    }
  }

  @override
  void initState() {
    super.initState();
    _getClasses();
  }

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
              hint: Text('Select Class',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20,
                color: Theme.of(context).hintColor,
              ),
            ),
            items: classes.map((item) => DropdownMenuItem<String>(
              onTap: () {
                students.clear();
                _getStudents(item);
              },
              value: item,
              child: Text(item, textAlign: TextAlign.center, style: const TextStyle(fontSize: 20))
            )).toList(),
          value: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value as String;
            });
          },
          buttonStyleData: const ButtonStyleData(height: 40, width: 200),
          menuItemStyleData: const MenuItemStyleData(height: 50),
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
