import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:minerva/Controller/ChatService.dart';
import 'package:minerva/Controller/FirebaseFunctions.dart';
import 'package:minerva/Model/WidgetProperties.dart';
import 'package:minerva/Model/CustomWidgets.dart';
import '../Model/ChatTile.dart';

class ChatPage extends StatefulWidget {
  final String chatID;
  final String userName;

  const ChatPage({Key? key, required this.chatID, required this.userName}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  Stream<QuerySnapshot>? _chats;
  TextEditingController _textEditingController = TextEditingController();


  _sendMessage() {
    if(_textEditingController.text.isNotEmpty) {
      Map<String, dynamic> chatMessageMap = {
        "message": _textEditingController.text,
        "sender": widget.userName,
        "time": DateTime.now().millisecondsSinceEpoch
      };
      ChatService().sendMessage(widget.chatID, chatMessageMap);
      ChatService().getChats(widget.chatID).then((Stream<QuerySnapshot> val) {
        setState(() {
          _chats = val;
          _textEditingController.text = "";
        });
      });
    }
  }

  Widget _chatMessages() {
    return StreamBuilder <QuerySnapshot>(
        stream: _chats,
        builder: (context, snapshot) {
          return snapshot.hasData ? ListView.builder(
            reverse: true,
            physics: BouncingScrollPhysics(),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
              return ChatTile(message: snapshot.data!.docs[snapshot.data!.docs.length - index - 1].get("message"), sender: snapshot.data!.docs[snapshot.data!.docs.length - index - 1].get("sender"), sentByMe: widget.userName == snapshot.data!.docs[snapshot.data!.docs.length - index - 1].get("sender"));
              }
          ) : Container();
        },
    );
  }

  @override
  void initState() {
    super.initState();
    ChatService().getChats(widget.chatID).then((Stream<QuerySnapshot> val) {
      setState(() {
        _chats = val;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('CHATS', style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic)),
        elevation: 0.0,
        automaticallyImplyLeading: true,
        backgroundColor: PageColors.mainColor,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Expanded(
              child: _chatMessages()
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textEditingController,
                      decoration: InputDecoration(hintText: 'Type your message...'),
                    ),
                  ),
                  IconButton(icon: Icon(Icons.send),
                    onPressed: () {
                      _sendMessage();
                    }
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: customDrawer()
    );
  }
}