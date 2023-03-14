import 'package:flutter/material.dart';
import 'package:minerva/Model/WidgetProperties.dart';
import 'package:minerva/Model/CustomWidgets.dart';
import '../Model/ChatTile.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatTile> _message = [];
  TextEditingController _textEditingController = TextEditingController();
  bool testSender = false;

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
              child: ListView.builder(
                itemCount: _message.length,
                itemBuilder: (context, index) {
                  return _message[index];
                },
              ),
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
                      if (_textEditingController.text.isNotEmpty) {
                        setState(() {
                          _message.add(ChatTile(message: _textEditingController.text, sentByMe: testSender, sender: 'Altay'),
                          );
                          _textEditingController.clear();
                          testSender =! testSender;
                        });
                      }
                    },)
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