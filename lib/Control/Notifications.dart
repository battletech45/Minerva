import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;

class NotificationsScreen extends StatefulWidget {
  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {

  String? fcmToken;
  final _firebaseMessaging = FirebaseMessaging.instance;
  final streamCtlr = StreamController<String>.broadcast();
  final titleCtlr = StreamController<String>.broadcast();
  final bodyCtlr = StreamController<String>.broadcast();

  Future<void> saveDeviceToken() async {
    fcmToken = await FirebaseMessaging.instance.getToken();
    print(fcmToken);
  }

  Future<void> sendNotification(String fcmToken, String title, String message) async {
    final url = Uri.parse('https://fcm.googleapis.com/fcm/send');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'key=AAAAql75Hzc:APA91bHjN2iv42ZYYA_hDKVKEC3fhOKmmDsD36YQPA7WLJSiuQpP9xnZznsMuekHFj2Idkt25_SMTbnNN4kY3shHgD6fGBwiplfPSxfUcvIWHT3XHo4zYpkUexdSobQEtlUiyzjsoZ2m', // Replace with your FCM server key
    };

    final body = {
      'to': fcmToken,
      'notification': {'title': title, 'body': message},
      'data': {'click_action': 'FLUTTER_NOTIFICATION_CLICK'},
    };

    final response = await http.post(url, headers: headers, body: jsonEncode(body));

    if (response.statusCode == 200) {
      print('Notification sent successfully!');
    } else {
      print('Failed to send notification. Error: ${response.body}');
    }
  }

  Future<void> onBackgroundMessage(RemoteMessage message) async {

    if (message.data.containsKey('data')) {
      // Handle data message
      final data = message.data['data'];
    }

    if (message.data.containsKey('notification')) {
      // Handle notification message
      final notification = message.data['notification'];
    }
    // Or do other work.
  }

  setNotifications() {
    FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);
    FirebaseMessaging.onMessage.listen(
          (message) async {
        if (message.data.containsKey('data')) {
          // Handle data message
          streamCtlr.sink.add(message.data['data']);
        }
        if (message.data.containsKey('notification')) {
          // Handle notification message
          streamCtlr.sink.add(message.data['notification']);
        }
        // Or do other work.
        titleCtlr.sink.add(message.notification!.title!);
        bodyCtlr.sink.add(message.notification!.body!);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    saveDeviceToken();
    setNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notifications')),
      body: MaterialButton(
        color: Colors.blue,
        child: Text('Send a notification'),
        onPressed: () => sendNotification(fcmToken!, 'Hello test user', 'This is a test for new functionality.'),
      )
    );
  }
}
