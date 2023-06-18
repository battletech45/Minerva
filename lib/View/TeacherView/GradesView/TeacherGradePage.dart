import 'package:flutter/services.dart';
import 'package:minerva/Control/FirebaseFunctions.dart';
import 'package:minerva/Model/CustomWidgets.dart';
import 'package:flutter/material.dart';
import '../../../Control/SharedFunctions.dart';
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
  String profession = '';

  TextEditingController? _projectController;
  TextEditingController? _quizController;
  TextEditingController? _examController;

  getProfession() async {
    var email = await SharedFunctions.getUserEmailSharedPreference();
    var teacher = await FirebaseFunctions().getTeacherData(email!);
    setState(() {
      profession = teacher.docs[0].get('profession');
    });
  }

  @override
  void initState() {
    super.initState();
    _projectController = TextEditingController();
    _quizController = TextEditingController();
    _examController = TextEditingController();
    getProfession();
  }

  @override
  void dispose() {
    _projectController?.dispose();
    _quizController?.dispose();
    _examController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Enter Grade'),
        elevation: 0.0,
        automaticallyImplyLeading: true,
        backgroundColor: PageColors.mainColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back), onPressed: () {Navigator.pop(context);},
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide()), color: Colors.white),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                 SizedBox(height: 15),
                Text('Project', style: TextStyle(fontSize: 22)),
                TextFormField(
                  controller: _projectController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                    hintText: 'Enter your project grade',
                  ),
                  onSaved: (value) {
                    _grade = value!;
                  },
                ),
                SizedBox(height: 5),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: PageColors.thirdColor),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      _gradeTask(widget.studentID, profession, 'project',
                          _projectController!.text);
                    }
                  },
                  child: Text(
                    'Submit Project',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(height: 25),
                Text('Quiz', style: TextStyle(fontSize: 22)),
                TextFormField(
                  controller: _quizController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                    hintText: 'Enter your quiz grade',
                  ),
                  onSaved: (value) {
                    _grade = value!;
                  },
                ),
                SizedBox(height: 5),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: PageColors.thirdColor),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      _gradeTask(
                          widget.studentID, profession, 'quiz', _quizController!.text);
                    }
                  },
                  child: Text(
                    'Submit Quiz',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(height: 25),
                Text('Exam', style: TextStyle(fontSize: 22)),
                TextFormField(
                  controller: _examController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                    hintText: 'Enter your exam grade',
                  ),
                  onSaved: (value) {
                    _grade = value!;
                  },
                ),
                SizedBox(height: 5),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: PageColors.thirdColor),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      _gradeTask(
                          widget.studentID, profession, 'exam', _examController!.text);
                    }
                  },
                  child: Text(
                    'Submit Exam',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(height: 85.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style:
                    ElevatedButton.styleFrom(
                      backgroundColor: PageColors.thirdColor,
                      padding: EdgeInsets.all(10),
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () {
                      _gradeAllTasks(widget.studentID, profession, _quizController!.text, _projectController!.text, _examController!.text);
                    },
                    child: Text('Submit All', style: TextStyle(fontSize: 25)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: customDrawer(),
    );
  }

  void _gradeTask(String studentID, String courseName, String gradeType, String grade) async {
    try {
      await FirebaseFunctions()
          .gradeTask(studentID, courseName, gradeType, grade);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Grade saved')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save grade')),
      );
    }
  }
  void _gradeAllTasks(String studentID, String courseName, String quiz, String project, exam) async {
    try {
      await FirebaseFunctions().gradeAllTasks(studentID, courseName, quiz, project, exam);
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
