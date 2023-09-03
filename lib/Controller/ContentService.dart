import 'package:cloud_firestore/cloud_firestore.dart';

// This is the new snippet:
class ContentService {
  final String? userID;

  ContentService({
    this.userID,
  });

  // Collection references
  final CollectionReference contentsCollection =
      FirebaseFirestore.instance.collection('contents');

// Used for getting all contents
  Future<QuerySnapshot> getAllContents() async {
    return contentsCollection.get();
  }

// Used for getting content
  Future<QuerySnapshot> getContent(String contentID) async {
    QuerySnapshot snapshot = await contentsCollection.where('contentID', isEqualTo: contentID).get();
    return snapshot;
  }

// Used for sending content
  Future sendContent(Map<String, dynamic> contentData) async {
    DocumentReference docRef = await contentsCollection.add({
      ...contentData,
      'likeCount': 0
    });
    await docRef.update({
      'contentID': docRef.id
    });
  }
  
  // Used for updating like counter
  Future updateLikeCounter(String contentID, int count, String userID) async {
    contentsCollection.doc(contentID).update({
      'likeCount': count,
      'whoLiked': FieldValue.arrayUnion([userID])
    });
  }

  // Used for deleting user from like list
  Future deleteUserFromLikedList(String contentID, String userID) async {
    contentsCollection.doc(contentID).update({
      'whoLiked': FieldValue.arrayRemove([userID])
    });
  }
}
