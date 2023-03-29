import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:minerva/Control/FirebaseFunctions.dart';
import 'package:minerva/Model/CustomWidgets.dart';
import 'package:flutter/material.dart';
import '../../../Model/WidgetProperties.dart';

class TeacherGradePage extends StatefulWidget {
  final String studentID;
  const TeacherGradePage({Key? key, required this.studentID}) : super(key: key);

  @override
  State<TeacherGradePage> createState() => _TeacherGradePageState();
}

class _TeacherGradePageState extends State<TeacherGradePage> {
  final _formKey = GlobalKey<FormState>();
  String _grade = '';

  TextEditingController? _homeworkController;
   TextEditingController? _quizController;
   TextEditingController? _examController;

  @override
  void initState() {
    super.initState();
    _homeworkController = TextEditingController();
    _quizController = TextEditingController();
    _examController = TextEditingController();
  }

  @override
  void dispose() {
    _homeworkController?.dispose();
    _quizController?.dispose();
    _examController?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    String studentID = widget.studentID;
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text('Grades'),
          elevation: 0.0,
          automaticallyImplyLeading: true,
          backgroundColor: PageColors.mainColor,
      ),

      body: Padding(
        padding: const EdgeInsets.only(top: 25.0),
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(40.0),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide()), color: Colors.white),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Project', style: TextStyle(fontSize: 18)),
                  TextFormField(
                    controller: _homeworkController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                      hintText: 'Enter your project grade',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a grade';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _grade = value!;
                    },
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: PageColors.thirdColor),
                    onPressed: () {
                      if(_formKey.currentState!.validate()){
                        _formKey.currentState!.save();
                        _gradeTask(studentID, 'English', 'project', _homeworkController!.text);
                      }
                    },
                    child: Text('Submit'),
                  ),
                  SizedBox(height: 16),
                  Text('Quiz', style: TextStyle(fontSize: 18)),
                  TextFormField(
                    controller: _quizController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                      hintText: 'Enter your quiz grade',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a grade';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _grade = value!;
                    },
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: PageColors.thirdColor),
                    onPressed: () {
                      if(_formKey.currentState!.validate()){
                        _formKey.currentState!.save();
                        _gradeTask(studentID, 'English', 'quiz', _quizController!.text);
                      }
                    },
                    child: Text('Submit'),
                  ),
                  SizedBox(height: 16),
                  Text('Exam', style: TextStyle(fontSize: 18)),
                  TextFormField(
                    controller: _examController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                      hintText: 'Enter your exam grade',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a grade';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _grade = value!;
                    },
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: PageColors.thirdColor),
                    onPressed: () {
                      if(_formKey.currentState!.validate()){
                        _formKey.currentState!.save();
                        _gradeTask(studentID, 'English', 'exam', _examController!.text);
                      }
                    },
                    child: Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children:<Widget> [
            IconButton( icon: Icon(Icons.arrow_back),onPressed: (){

            },)
          ],
        ),
      ) ,
      drawer: customDrawer(),
    );
  }
  void _gradeTask(String studentID, String courseName, String gradeType, String grade) async {
    try {
      await FirebaseFunctions().gradeTask(studentID, courseName, gradeType, grade);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Grade saved')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save grade')),
      );
    }
  }
}