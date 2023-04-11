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
  TextEditingController textEditingController = TextEditingController();
  List students = [];
  List<String> classes = [];
  List<String> studentIDs = [];
  Map<String, dynamic> enteredAttendance = {};
  String? selectedValue;
  bool selected = false;

  _getClasses() async {
    var val = await FirebaseFunctions().getAllClasses();
    var size = val.size;
    for (int i = 0; i < size; i++) {
      setState(() {
        classes.add(val.docs[i].get('className'));
      });
    }
  }

  _getStudents(String className) async {
    var val = await FirebaseFunctions().getClassData(className);
    List<dynamic> studentList = val.docs[0].get('students');
    for (int i = 0; i < studentList.length; i++) {
      var name = await FirebaseFunctions().getStudentDataViaID(studentList[i]);
      setState(() {
        studentIDs.add(name.docs[0].get('studentID'));
        students.add(name.docs[0].get('studentName'));
      });
    }
  }

  _saveStudentAttendance(String ID, String attendance) {
    if (enteredAttendance.containsKey(ID)) {
      enteredAttendance.update(ID, (value) => attendance);
    } else {
      enteredAttendance[ID] = attendance;
    }
    print(enteredAttendance);
  }

  _uploadAttendance() async {
    enteredAttendance.forEach((key, value) {
      FirebaseFunctions().changeAttendance('English', value, key);
    });
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
                      onTap: () {
                        students.clear();
                        _getStudents(item);
                      },
                      value: item,
                      child: Text(item,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 22))))
                  .toList(),
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
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: students.length,
                  itemBuilder: (context, index) {
                    return Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: PageColors.secondaryColor,
                                    width: 2))),
                        child: customEditExpansionPanel(
                            name: students[index],
                            function: (String val) => _saveStudentAttendance(
                                studentIDs[index], val)));
                  }),
            ),
          ),
          Visibility(
            visible: selected,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style:
                    ElevatedButton.styleFrom(
                      backgroundColor: PageColors.mainColor,
                      padding: EdgeInsets.all(10),
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                onPressed: () {
                  _uploadAttendance();
                },
                child: Text('Submit', style: TextStyle(fontSize: 25)),
              ),
            ),
          ),
          SizedBox(height: 20.0)
        ],
      ),
      drawer: customDrawer(),
    );
  }
}
