import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../Model/WidgetProperties.dart';

class GradePage extends StatefulWidget {

  const GradePage({Key? key}) : super(key: key);


  @override
  State<GradePage> createState() => _GradePageState();
}

class _GradePageState extends State<GradePage> {
  final _formKey = GlobalKey<FormState>();
  late String _grade;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PageColors.mainColor,
        title: Text('Grade '),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Grade'),
                keyboardType: TextInputType.number,
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      _gradeExam();
                    }
                  },
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
//Bu kısıma bakalım
  void _gradeExam() async {
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

