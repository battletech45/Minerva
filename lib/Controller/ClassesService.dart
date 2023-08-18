import 'package:cloud_firestore/cloud_firestore.dart';

// This is the new snippet:
class ClassesService {
  final String? userID;

  ClassesService({
    this.userID,
  });

  // Collection references
  final CollectionReference classCollection =
      FirebaseFirestore.instance.collection('classes');

// Used for getting all classes
  Future<QuerySnapshot> getAllClasses() async {
    return classCollection.get();
  }

// Used for getting class data
  Future<QuerySnapshot> getClassData(String className) async {
    QuerySnapshot snapshot =
        await classCollection.where('className', isEqualTo: className).get();
    return snapshot;
  }
  // Used for adding class material 
  Future createClassMaterial(String className, Map<String, dynamic> data) async {
    var val = await getClassData(className);
    classCollection.doc(val.docs[0].get('classID')).update({
      'Materials': FieldValue.arrayUnion([data]),
    });
  }
  // Used for finding student's class
  Future<String?> findStudentsClass(String studentID) async {
    QuerySnapshot snapshot = await getAllClasses();
    for (int i = 0; i < snapshot.size; i++) {
      List val = snapshot.docs[i].get('students');
      if (val.contains(studentID)) {
        return snapshot.docs[i].get('className');
      }
    }
    return null;
  }
  
  // Used for sending new announcement
    Future sendNewAnnouncement(String className, announcement) async {
    QuerySnapshot querySnapshot = await classCollection.where('className', isEqualTo: className).get();
    await classCollection.doc(querySnapshot.docs[0].id).update({
      'announcements': FieldValue.arrayUnion(announcement)
    });
  }

  // Used for adding student to submitted list
   Future addStudentToSubmittedList(String className, Map<String, dynamic> data) async {
    var val = await getClassData(className);
    classCollection.doc(val.docs[0].get('classID')).update({
      'submittedStudents': FieldValue.arrayUnion([data]),
    });
  }
}
