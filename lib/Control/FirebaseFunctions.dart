import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';

class FirebaseFunctions {
  final String? userID;

  FirebaseFunctions({
    this.userID,
});

  final CollectionReference studentCollection = FirebaseFirestore.instance.collection('students');
  final CollectionReference teacherCollection = FirebaseFirestore.instance.collection('teachers');
  final CollectionReference chatsCollection = FirebaseFirestore.instance.collection('chats');
  final CollectionReference modelCollection = FirebaseFirestore.instance.collection('model');
  final CollectionReference classCollection = FirebaseFirestore.instance.collection('classes');
  final CollectionReference contentsCollection = FirebaseFirestore.instance.collection('contents');

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
  Future createClassMaterial(String className, Map<String, dynamic> data) async {
    var val = await getClassData(className);
    classCollection.doc(val.docs[0].get('classID')).update({
      'Materials': FieldValue.arrayUnion([data]),
    });
  }
  Future addStudentToSubmittedList(String className, Map<String, dynamic> data) async {
    var val = await getClassData(className);
    classCollection.doc(val.docs[0].get('classID')).update({
      'submittedStudents': FieldValue.arrayUnion([data]),
    });
  }
  Future<String?> findStudentsClass(String studentID) async {
    QuerySnapshot snapshot = await getAllClasses();
    for(int i =  0; i < snapshot.size; i++) {
      List val = snapshot.docs[i].get('students');
      if(val.contains(studentID)) {
        return snapshot.docs[i].get('className');
      }
    }
    return null;
  }
  Future<QuerySnapshot> getStudentData(String email) async {
    QuerySnapshot snapshot = await studentCollection.where('email', isEqualTo: email).get();
    return snapshot;
  }
  Future<QuerySnapshot> getStudentDataViaID(String ID) async {
    QuerySnapshot snapshot = await studentCollection.where('studentID', isEqualTo: ID).get();
    return snapshot;
  }
  Future<QuerySnapshot> getClassData(String className) async {
    QuerySnapshot snapshot = await classCollection.where('className', isEqualTo: className).get();
    return snapshot;
  }
  Future<QuerySnapshot> getTeacherData(String email) async {
    QuerySnapshot snapshot = await teacherCollection.where('email', isEqualTo: email).get();
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
  Future<QuerySnapshot> getAllClasses() async {
    return classCollection.get();
  }
  Future<Stream<QuerySnapshot>> getAllContents() async {
    return contentsCollection.snapshots();
  }
  Future<List<String>> getAllImageURLs() async {
    var val = await contentsCollection.get();
    List<String> urls = [];
    for(int i = 0; i < val.docs.length; i++) {
      if(val.docs[i].get('contentType') == 'Image') {
        urls.add(val.docs[i].get('imageURL'));
      }
    }
    return urls;
  }
  void sendMessage(String chatID, chatMessageData) {
    chatsCollection.doc(chatID).collection('messages').add(chatMessageData);
    chatsCollection.doc(chatID).update({
      'recentMessage': chatMessageData['message'],
      'recentMessageSender': chatMessageData['sender'],
      'recentMessageTime': chatMessageData['time'].toString()
    });
  }
  Future sendContent(Map<String, dynamic> contentData) async {
    DocumentReference docRef = await contentsCollection.add({
      ...contentData,
      'likeCount': 0
    });
    await docRef.update({
      'contentID': docRef.id
    });
  }

  Future gradeTask(String studentID, String courseName, String gradeType, String grade) async {
    studentCollection.doc(studentID).update({
      'courses.$courseName.$gradeType': grade
    });
  }
  Future gradeAllTasks(String studentID, String courseName, String quizGrade, String projectGrade, String examGrade) async {
    studentCollection.doc(studentID).update({
      'courses.$courseName.quiz': quizGrade,
      'courses.$courseName.project': projectGrade,
      'courses.$courseName.exam': examGrade,
    });
  }
  Future changeAttendance(String course, String attendance, String studentID) async {
    studentCollection.doc(studentID).update({
      'courses.$course.attendance': attendance
    });
  }
  Future sendNewAnnouncement(String className, announcement) async {
    QuerySnapshot querySnapshot = await classCollection.where('className', isEqualTo: className).get();
    await classCollection.doc(querySnapshot.docs[0].id).update({
      'announcements': FieldValue.arrayUnion(announcement)
    });
  }
  Future<Map<String, dynamic>> getStudentCourses(String studentID) async {
    DocumentSnapshot snapshot = await studentCollection.doc(studentID).get();
    return snapshot.get('courses');
  }
  updateStudentPassword(String password, String uid) async {
    return await studentCollection.doc(uid).update({
      'password': password
    });
  }
  updateTeacherPassword(String password, String uid) async {
    return await teacherCollection.doc(uid).update({
      'password': password
    });
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