import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseFunctions {
  final String? userID;

  FirebaseFunctions({
    this.userID,
});

  final CollectionReference studentCollection = FirebaseFirestore.instance.collection('students');
  final CollectionReference teacherCollection = FirebaseFirestore.instance.collection('teachers');
  final CollectionReference schoolCollection = FirebaseFirestore.instance.collection('schools');

  Future createStudent(String studentName, String password, String email) async {
    await studentCollection.add({
      'studentName': studentName,
      'password': password,
      'email': email,
      'courses': [],
      'schoolNumber': ''
    });
  }
  Future createTeacher(String teacherName, String password, String email) async {
    await teacherCollection.add({
      'studentName': teacherName,
      'password': password,
      'email': email,
      'courses': [],
      'teacherID': ''
    });
  }
  Future createSchool(String schoolName, String password, String email, String principalName) async {
    await schoolCollection.add({
      'studentName': schoolName,
      'password': password,
      'email': email,
      'principleName': principalName,
      'schoolNumber': ''
    });
  }
  Future<QuerySnapshot> getStudentData(String email) async {
    QuerySnapshot snapshot = await studentCollection.where('email', isEqualTo: email).get();
    return snapshot;
  }
  Future<QuerySnapshot> getTeacherData(String email) async {
    QuerySnapshot snapshot = await teacherCollection.where('email', isEqualTo: email).get();
    return snapshot;
  }
  Future<QuerySnapshot> getSchoolData(String email) async {
    QuerySnapshot snapshot = await schoolCollection.where('email', isEqualTo: email).get();
    return snapshot;
  }
}