import 'package:flutter/material.dart';
import 'package:minerva/Model/WidgetProperties.dart';

class ChatTile extends StatelessWidget {

  final String message;
  final String sender;
  final bool sentByMe;

  ChatTile({required this.message, required this.sender, required this.sentByMe});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 4.0, bottom: 4.0, left: sentByMe ? 0 : 24, right: sentByMe ? 24 : 0),
      alignment: sentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: sentByMe ? EdgeInsets.only(left: 30.0) : EdgeInsets.only(right: 30),
        padding: EdgeInsets.only(top: 17, bottom: 17, left: 20, right: 20),
        decoration: BoxDecoration(
            borderRadius: sentByMe ? BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16), bottomLeft: Radius.circular(16))
                :
                BorderRadius.only(topRight: Radius.circular(16), topLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
          color: sentByMe ? PageColors.thirdColor : Colors.grey[500]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(sender, textAlign: TextAlign.start, style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold)),
            SizedBox(height: 7.0),
            Text(message, textAlign: TextAlign.start, style: TextStyle(fontSize: 15.0, color: Colors.white))
          ],
        ),
      ),
    );
  }
}