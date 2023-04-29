import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../Control/FirebaseFunctions.dart';
import '../../../Control/SharedFunctions.dart';
import '../../../Model/WidgetProperties.dart';

class StudentHomeWorkViewPage extends StatefulWidget {
  @override
  _StudentHomeWorkViewPageState createState() => _StudentHomeWorkViewPageState();
}

class _StudentHomeWorkViewPageState extends State<StudentHomeWorkViewPage > {

  final List<HomeworkItem> homeworkItems = [];
  int _selectedIndex = -1;
  bool isHomeWorkExist = false;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  _getHomeworks() async {
    var email = await SharedFunctions.getUserEmailSharedPreference();
    var student = await FirebaseFunctions().getStudentData(email!);
    String? className = await FirebaseFunctions().findStudentsClass(student.docs[0].get('studentID'));
    var val = await FirebaseFunctions().getClassData(className!);
    List data = val.docs[0].get('Materials');
    data.forEach((element) {
      homeworkItems.add(HomeworkItem(name: element['assignmentTitle'], definition: element['assignmentContent'], isSubmitable: element['submitOpen'], fileName: element['pickedFileName']));
    });
    if(homeworkItems.isEmpty) {
      setState(() {
        isHomeWorkExist = false;
      });
    }
    else {
      setState(() {
        isHomeWorkExist = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getHomeworks();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isHomeWorkExist ? ListView.builder(
        itemCount: homeworkItems.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(homeworkItems[index].name),
            onTap: () {
              _onItemTapped(index);
            },
          );
        },
      ) : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/logo.png', width: 300, height: 300),
          Text('There is no material for this course !', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0, fontStyle: FontStyle.italic, color: PageColors.thirdColor))
        ],
      ),
      floatingActionButton: _selectedIndex != -1 ? FloatingActionButton(
        onPressed: () {
          setState(() {
            _selectedIndex = -1;
          });
        },
        child: Icon(Icons.clear),
      ) : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomSheet: _selectedIndex != -1 ? Container(
        decoration: BoxDecoration(
          border: Border(
              top: BorderSide(color: PageColors.mainColor, width: 3),
          )
        ),
        height: 300.0,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Text(homeworkItems[_selectedIndex].name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0, fontStyle: FontStyle.italic, color: PageColors.thirdColor)),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                homeworkItems[_selectedIndex].definition,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            Visibility(
              visible: homeworkItems[_selectedIndex].isSubmitable,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width: 10.0),
                  Text('Homework Material', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0, fontStyle: FontStyle.italic, color: PageColors.thirdColor)),
                  SizedBox(width: 15.0),
                  Icon(FontAwesomeIcons.arrowTurnDown)
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Visibility(
              visible: homeworkItems[_selectedIndex].isSubmitable,
              child: Container(
                width: 300,
                  child: Text(homeworkItems[_selectedIndex].fileName!)
              ),
            ),
           SizedBox(height: 20.0),
            Visibility(
              visible: homeworkItems[_selectedIndex].isSubmitable,
              child: MaterialButton(
                height: 45,
                minWidth: 45,
                onPressed: () {

                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Text("Submit",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20
                ),),
                color: PageColors.thirdColor,),
            )
          ],
        ),
      ) : null,
    );
  }
}

class HomeworkItem {
  final String name;
  final String definition;
  final String? fileName;
  final bool isSubmitable;

  HomeworkItem({required this.name, required this.definition, this.fileName, required this.isSubmitable});
}
