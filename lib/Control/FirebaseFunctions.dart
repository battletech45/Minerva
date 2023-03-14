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

  Future createStudent(String studentName, String password, String email, String tc, String studentNumber) async {
    await studentCollection.add({
      'studentName': studentName,
      'password': password,
      'email': email,
      'courses': [],
      'schoolNumber': studentNumber,
      'tc':tc,
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
  Future<Stream<QuerySnapshot>> getChats(String chatID) async {
    return FirebaseFirestore.instance.collection('chats').doc(chatID).collection('messages').orderBy('time').snapshots();
  }
  void sendMessage(String chatID, chatMessageData) {
    FirebaseFirestore.instance.collection('chats').doc(chatID).collection('messages').add(chatMessageData);
    FirebaseFirestore.instance.collection('chats').doc(chatID).update({
      'recentMessage': chatMessageData['message'],
      'recentMessageSender': chatMessageData['sender'],
      'recentMessageTime': chatMessageData['time'].toString()
    });
  }
  Future createChat(String studentID, String studentName, String teacherID, String teacherName) async {
    DocumentReference chatDocRef = await chatsCollection.add({
      'members': [],
      'chatID': '',
      'recentMessage': '',
      'recentMessageSender': '',
    });

    await chatDocRef.update({
      'members': FieldValue.arrayUnion([studentID + '_' + studentName]),
      'chatID': chatDocRef.id
    });
    await chatDocRef.update({
      'members': FieldValue.arrayUnion([teacherID + '_' + teacherName])
    });
  }
}