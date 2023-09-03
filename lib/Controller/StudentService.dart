import 'package:cloud_firestore/cloud_firestore.dart';
// This is the new snippet:
class StudentService {
  final String? userID;

  StudentService({
    this.userID,
  });

// Collection references
  final CollectionReference studentCollection =
      FirebaseFirestore.instance.collection('students');

// Used for creating a new student
  Future createStudent(String studentName, String password, String email,
      String tc, String studentNumber, String registerNumber) async {
    DocumentReference docRef = await studentCollection.add({
      'studentName': studentName,
      'password': password,
      'email': email,
      'courses': [],
      'studentNumber': studentNumber,
      'tc': tc,
      'registerNumber': registerNumber,
      'studentID': ''
    });
    await docRef.update({'studentID': docRef.id});
  }

  // Used for getting all students
    Future<Stream<QuerySnapshot>> getAllStudents() async {
    return studentCollection.snapshots();
  }

  // Used for getting stundents' data
    Future<QuerySnapshot> getStudentData(String email) async {
    QuerySnapshot snapshot = await studentCollection.where('email', isEqualTo: email).get();
    return snapshot;
  }

  // Used for getting stundents' data via ID
  Future<QuerySnapshot> getStudentDataViaID(String ID) async {
    QuerySnapshot snapshot = await studentCollection.where('studentID', isEqualTo: ID).get();
    return snapshot;
  }

  // Used for getting student's courses
    Future<Map<String, dynamic>> getStudentCourses(String studentID) async {
    DocumentSnapshot snapshot = await studentCollection.doc(studentID).get();
    return snapshot.get('courses');
  }

  // Used for grading student's task
   Future gradeTask(String studentID, String courseName, String gradeType, String grade) async {
    studentCollection.doc(studentID).update({
      'courses.$courseName.$gradeType': grade
    });
  }

  // Used for grading student's all tasks
  Future gradeAllTasks(String studentID, String courseName, String quizGrade, String projectGrade, String examGrade) async {
    studentCollection.doc(studentID).update({
      'courses.$courseName.quiz': quizGrade,
      'courses.$courseName.project': projectGrade,
      'courses.$courseName.exam': examGrade,
    });
  }
  // Used for changing student's attendance
  Future changeAttendance(String course, String attendance, String studentID) async {
    studentCollection.doc(studentID).update({
      'courses.$course.attendance': attendance
    });
  }

  // Used for updating student password
   updateStudentPassword(String password, String uid) async {
    return await studentCollection.doc(uid).update({
      'password': password
    });
  }
}
