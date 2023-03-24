// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:minerva/Model/CustomWidgets.dart';
import 'package:flutter/material.dart';
import '../Model/WidgetProperties.dart';

class TeacherGradePage extends StatefulWidget {
  const TeacherGradePage({Key? key}) : super(key: key);

  @override
  State<TeacherGradePage> createState() => _TeacherGradePageState();
}

class _TeacherGradePageState extends State<TeacherGradePage> {
  final _formKey = GlobalKey<FormState>();
  late String _grade;


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
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Grades',
          ),
          elevation: 0.0,
          automaticallyImplyLeading: true,
          backgroundColor: PageColors.mainColor,
      ),

      body: Padding(
        padding: const EdgeInsets.only(top: 25.0),
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
                Text('Homework', style: TextStyle(fontSize: 18)),
                TextFormField(
                  controller: _homeworkController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                    hintText: 'Enter your homework grade',
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
                      _gradeTask();
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
                      _gradeTask();
                    }
                    // Quiz notu kaydetme işlemleri burada yapılacak.
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
                      _gradeTask();
                    }
                    // Exam notu kaydetme işlemleri burada yapılacak.
                  },
                  child: Text('Submit'),
                ),

              ],

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
  void _gradeTask() async {
    try {
      await FirebaseFirestore.instance
          .collection('students');
      //.doc(widget.studentId)
      //.update({'grade': _grade});


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
