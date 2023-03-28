import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseFunctions {
  final String? userID;

  FirebaseFunctions({
    this.userID,
});

  final CollectionReference studentCollection = FirebaseFirestore.instance.collection('students');
  final CollectionReference teacherCollection = FirebaseFirestore.instance.collection('teachers');
  final CollectionReference schoolCollection = FirebaseFirestore.instance.collection('schools');
  final CollectionReference chatsCollection = FirebaseFirestore.instance.collection('chats');
  final CollectionReference modelCollection = FirebaseFirestore.instance.collection('model');

  Future createStudent(String studentName, String password, String email, String tc, String studentNumber, String registerNumber) async {
    DocumentReference docRef = await studentCollection.add({
      'studentName': studentName,
      'password': password,
      'email': email,
      'courses': [],
      'studentNumber': studentNumber,
      'tc':tc,
      'registerNumber': registerNumber,
      'studentID': ''
    });
    await docRef.update({
      'studentID': docRef.id
    });
  }
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
  Future<Stream<QuerySnapshot>> getChats(String chatID) async {
    return FirebaseFirestore.instance.collection('chats').doc(chatID).collection('messages').orderBy('time').snapshots();
  }
  Future<Stream<QuerySnapshot>> getAllTeachers() async {
    return teacherCollection.snapshots();
  }
  Future<Stream<QuerySnapshot>> getAllStudents() async {
    return studentCollection.snapshots();
  }
  Future<QuerySnapshot> getAllChats() async {
    return chatsCollection.get();
  }
  void sendMessage(String chatID, chatMessageData) {
    FirebaseFirestore.instance.collection('chats').doc(chatID).collection('messages').add(chatMessageData);
    FirebaseFirestore.instance.collection('chats').doc(chatID).update({
      'recentMessage': chatMessageData['message'],
      'recentMessageSender': chatMessageData['sender'],
      'recentMessageTime': chatMessageData['time'].toString()
    });
  }
  Future gradeTask(String studentID, String courseName, String gradeType, String grade) async {
    studentCollection.doc(studentID).update({
      'courses.$courseName.$gradeType': grade
    });
  }
  Future<Map<String, dynamic>> getStudentCourses(String studentID) async {
    DocumentSnapshot snapshot = await studentCollection.doc(studentID).get();
    return snapshot.get('courses');
  }
  Future createChat(String studentID, String teacherID) async {
    DocumentReference chatDocRef = await chatsCollection.add({
      'members': [],
      'chatID': '',
      'recentMessage': '',
      'recentMessageSender': '',
    });

    await chatDocRef.update({
      'members': [studentID, teacherID],
      'chatID': chatDocRef.id
    });
    return chatDocRef.id;
  }

  Future<List<String>> getTokens() async{
    List<String> data = [];
    var val = await modelCollection.doc('n3sugofTvAvEJEoxjcip').get();
    if(val.exists) {
      data.add(val.get('studentToken'));
      data.add(val.get('teacherToken'));
    }
    return data;
  }
}