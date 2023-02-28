import 'package:flutter/material.dart';
import 'package:minerva/Model/WidgetProperties.dart';
import 'package:minerva/Model/CustomWidgets.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<BubbleMessage> _message = [];
  TextEditingController _textEditingController = TextEditingController();

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
                          _message.add(BubbleMessage(
                              text: _textEditingController.text, isMe: true),
                          );
                          _textEditingController.clear();
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

class BubbleMessage extends StatelessWidget {
  final String text;
  final bool isMe;



  BubbleMessage({required this.text, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.only(top:16,left: 200, right: 50),
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          decoration: BoxDecoration(
            color: isMe ? Colors.green : Colors.grey[300],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
              bottomLeft: isMe ? Radius.circular(16) : Radius.circular(0),
              bottomRight: isMe ? Radius.circular(0) : Radius.circular(16),
            ),
          ),
          child: Text(
            textAlign: TextAlign.center,
            text,
            style: TextStyle(color: isMe ? Colors.white : Colors.black,
            ),
          ),
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 1.0,horizontal: 1.0),
          child: CircleAvatar(backgroundColor: Colors.white,foregroundColor: Colors.black,
            child: Icon(Icons.man),maxRadius: 20.0,
          ),
        ),
      ],
    );
  }
}

