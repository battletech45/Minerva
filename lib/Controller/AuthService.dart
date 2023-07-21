import 'package:firebase_auth/firebase_auth.dart';
import 'package:minerva/Controller/FirebaseFunctions.dart';
import 'package:minerva/Controller/SharedFunctions.dart';


class AuthServices{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signInWithEmailAndPassword( String email, String password) async{
    var studentData = await FirebaseFunctions().getStudentData(email);
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      if(studentData.docs.isNotEmpty) {
          await SharedFunctions.saveUserLoggedInSharedPreference(true);
          await SharedFunctions.saveUserStudentSharedPreference(true);
          await SharedFunctions.saveUserEmailSharedPreference(email);
          await SharedFunctions.saveUserNameSharedPreference(studentData.docs[0].get('studentName'));
          if(studentData.docs[0].get('password') != password) {
            await FirebaseFunctions().updateStudentPassword(password, studentData.docs[0].get('studentID'));
          }
        }
        else {
          var teacherData = await FirebaseFunctions().getTeacherData(email);
          await SharedFunctions.saveUserStudentSharedPreference(false);
          await SharedFunctions.saveUserLoggedInSharedPreference(true);
          await SharedFunctions.saveUserEmailSharedPreference(email);
          await SharedFunctions.saveUserNameSharedPreference(teacherData.docs[0].get('teacherName'));
          if(teacherData.docs[0].get('password') != password) {
            await FirebaseFunctions().updateStudentPassword(password, teacherData.docs[0].get('teacherID'));
          }
        }
    }on FirebaseAuthException catch(e){
      print(e.toString());
    }
  }
Future signout() async {
    await FirebaseAuth.instance.signOut();
    await SharedFunctions.saveUserStudentSharedPreference(false);
    await SharedFunctions.saveUserEmailSharedPreference('');
    await SharedFunctions.saveUserLoggedInSharedPreference(false);
    await SharedFunctions.saveUserNameSharedPreference('');
  }
  
}