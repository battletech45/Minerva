import 'package:cloud_firestore/cloud_firestore.dart';
// This is the new snippet:
class ChatService {
  final String? userID;

  ChatService({
    this.userID,
  });

  // Collection references
  final CollectionReference chatsCollection = FirebaseFirestore.instance.collection('chats');
  
  // Used for getting chat
  Future<Stream<QuerySnapshot>> getChats(String chatID) async {
    return FirebaseFirestore.instance.collection('chats').doc(chatID).collection('messages').orderBy('time').snapshots();
  }

  // Used for getting all chats
  Future<QuerySnapshot> getAllChats() async {
    return chatsCollection.get();
  }

  // Used for creating a new chat
 Future createChat(String studentID, String teacherID, String userToken,String targetToken) async {
    DocumentReference chatDocRef = await chatsCollection.add({
      'members': [],
      'chatID': '',
      'recentMessage': '',
      'recentMessageSender': '',
      'tokens': [userToken,targetToken],
    });

    await chatDocRef.update({
      'members': [studentID, teacherID],
      'chatID': chatDocRef.id
    });
    return chatDocRef.id;
  }

  // Used for sending a message
   void sendMessage(String chatID, chatMessageData) {
    chatsCollection.doc(chatID).collection('messages').add(chatMessageData);
    chatsCollection.doc(chatID).update({
      'recentMessage': chatMessageData['message'],
      'recentMessageSender': chatMessageData['sender'],
      'recentMessageTime': chatMessageData['time'].toString()
    });
  }
}
