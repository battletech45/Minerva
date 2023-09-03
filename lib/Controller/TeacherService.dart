import 'package:cloud_firestore/cloud_firestore.dart';
// This is the new snippet:
class TeacherService {
  final String? userID;

  TeacherService({
    this.userID,
  });
  // Collection references
  final CollectionReference teacherCollection = FirebaseFirestore.instance.collection('teachers');
 
  // Used for creating a new teacher
  Future createTeacher(String teacherName, String password, String email, String tc, String teacherNumber, String registerNumber) async {
    DocumentReference docRef = await teacherCollection.add({
      'teacherName': teacherName,
      'password': password,
      'email': email,
      'courses': [],
      'teacherID': '',
      'teacherNumber': teacherNumber,
      'tc': tc,
      'registerNumber': registerNumber
    });
    await docRef.update({
      'teacherID': docRef.id
    });
  }

  // Used for getting teacher's data
  Future<QuerySnapshot> getTeacherData(String email) async {
    QuerySnapshot snapshot = await teacherCollection.where('email', isEqualTo: email).get();
    return snapshot;
  }

  // Used for getting teachers' data
  Future<Stream<QuerySnapshot>> getAllTeachers() async {
    return teacherCollection.snapshots();
  }

  // Used for updating teacher password
    updateTeacherPassword(String password, String uid) async {
    return await teacherCollection.doc(uid).update({
      'password': password
    });
  }
}