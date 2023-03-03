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
      'courses': '',
      'schoolNumber': ''
    });
  }
}