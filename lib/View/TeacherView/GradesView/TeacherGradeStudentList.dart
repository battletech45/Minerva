import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:minerva/Model/CustomWidgets.dart';
import 'package:minerva/View/TeacherView/GradesView/TeacherGradePage.dart';

import '../../../Controller/FirebaseFunctions.dart';
import '../../../Model/WidgetProperties.dart';


class TeacherGradeStudentList extends StatefulWidget {

  const TeacherGradeStudentList({Key? key}) : super(key: key);

  @override
  State<TeacherGradeStudentList> createState() => _TeacherGradeStudentListState();
}

class _TeacherGradeStudentListState extends State<TeacherGradeStudentList> {
  TextEditingController searchController = TextEditingController();
  TextEditingController textEditingController = TextEditingController();
  bool selected = false;
  List students = [];
  List<String> classes = [];
  List<String> studentIDs = [];
  String? selectedValue;
  String? selectedStudent;

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
    students.clear();
    studentIDs.clear();
    var val = await FirebaseFunctions().getClassData(className);
    List<dynamic> studentList = val.docs[0].get('students');
    for(int i = 0; i < studentList.length; i++) {
      var name = await FirebaseFunctions().getStudentDataViaID(studentList[i]);
      setState(() {
        studentIDs.add(name.docs[0].get('studentID'));
        students.add(name.docs[0].get('studentName'));
      });
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
        title: Text("Grade",
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
                    _getStudents(item);
                    setState(() {
                      selectedValue=item;
                    });
                  },
                  value: item,
                  child: Text(item, textAlign: TextAlign.center, style: const TextStyle(fontSize: 22))
              )).toList(),
              value: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value as String;
                  selected = true;
                });
              },
              buttonStyleData: ButtonStyleData(
                padding: EdgeInsets.all(10),
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: PageColors.mainColor,
                  ),
                    borderRadius: BorderRadius.circular(10),
                ),
              ),
            menuItemStyleData: const MenuItemStyleData(height: 50),
              dropdownStyleData: DropdownStyleData(
                maxHeight: 200,
                decoration: BoxDecoration(
                  border: Border.all(
                     color: PageColors.mainColor,
                  ),
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              dropdownSearchData: DropdownSearchData(
                searchController: textEditingController,
                searchInnerWidgetHeight: 60,
                searchInnerWidget: Container(
                  height: 60,
                  padding: const EdgeInsets.only(
                    top: 8,
                    bottom: 4,
                    right: 8,
                    left: 8,
                  ),
                  child: TextFormField(
                    expands: true,
                    maxLines: null,
                    controller: textEditingController,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 8,
                      ),
                      hintText: 'Search for a class',
                      hintStyle: const TextStyle(fontSize: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                searchMatchFn: (item, searchValue) {
                  return (item.value.toString().contains(searchValue));
                },
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: !selected ? Image.asset('assets/logo.png') :  ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: students.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: PageColors.secondaryColor, width: 2))),
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text(students[index][0]),
                        ),
                        title: Text(students[index], style: TextStyle(fontSize: 20)),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TeacherGradePage(studentID: studentIDs[index]),
                            ),
                          );
                        },
                      ),
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