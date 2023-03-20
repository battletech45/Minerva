import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minerva/Control/FirebaseFunctions.dart';
import '../Model/WidgetProperties.dart';
import 'ChatPage.dart';

class ChatsListPage extends StatefulWidget {
  @override
  State<ChatsListPage> createState() => _ChatsListPageState();
}

class _ChatsListPageState extends State<ChatsListPage> {
  Stream<QuerySnapshot>? allChatsSnapshot;
  FirebaseAuth auth = FirebaseAuth.instance;

  _getChats() async {
    var val = await FirebaseFunctions().getAllChats();
    setState(() {
      allChatsSnapshot = val;
    });
  }

  @override
  void initState() {
    super.initState();
    _getChats();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: true,
        backgroundColor: PageColors.mainColor,
        centerTitle: true,
        title: Text("CHATS", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: allChatsSnapshot,
        builder: (context, snapshot) {
          return ListView.builder(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data!.docs[index].get('chatID')),
                  subtitle: Text(snapshot.data!.docs[index].get('recentMessage')),
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => ChatPage(chatID: snapshot.data!.docs[index].get('chatID'), userName: auth.currentUser!.uid)));
                  },
                );
              }
          );
        }
      ),
    );
  }
}