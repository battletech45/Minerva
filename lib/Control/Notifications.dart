import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationHelper {
  static final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static Future<void> initialize() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('app_icon');
    final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );
    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  static Future<void> showCustomNotification(RemoteMessage message) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      'your_channel_id', // Change this to your own channel ID
      'Custom Notification', // Change this to a proper channel name
      channelDescription: 'Notification for custom content', // Change this to a proper description
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);

    await _flutterLocalNotificationsPlugin.show(
      0, // Notification ID
      message.notification!.title, // Notification title
      message.notification!.body, // Notification content
      platformChannelSpecifics,
      payload: 'custom_notification', // Optionally add a payload to identify the notification
    );
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

class FCM {
  final streamCtlr = StreamController<String>.broadcast();
  final titleCtlr = StreamController<String>.broadcast();
  final bodyCtlr = StreamController<String>.broadcast();

  setNotifications() {
    FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);
    FirebaseMessaging.onMessage.listen(
          (message) async {
        if (message.data.containsKey('data')) {
          streamCtlr.sink.add(message.data['data']);
        }
        if (message.data.containsKey('notification')) {
          streamCtlr.sink.add(message.data['notification']);
        }
        titleCtlr.sink.add(message.notification!.title!);
        bodyCtlr.sink.add(message.notification!.body!);

        NotificationHelper.showCustomNotification(message);
      },
    );
  }

  dispose() {
    streamCtlr.close();
    bodyCtlr.close();
    titleCtlr.close();
  }
}

class NotificationsScreen extends StatefulWidget {
  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {

  String? fcmToken;

  Future<void> saveDeviceToken() async {
    fcmToken = await FirebaseMessaging.instance.getToken();
    print(fcmToken);
  }

  Future<void> sendNotification(String title, String body, String fcmToken) async {
    final String fcmEndpoint = 'https://fcm.googleapis.com/fcm/send';

    final Map<String, dynamic> notificationData = {
      'notification': {
        'title': title,
        'body': body,
      },
      'priority': 'high',
      'to': 'cwlkfOiVSQimEHgxCkAs81:APA91bGH0L23mOYog4iBWCb0VH7bQysS-p7T-Epn20Eko9BqKYi3vDUQQV8aGLlwS8cd3uIeD8Ie2o5dFJdsE6EEkxMyNxXYp6eD4kgqYOyYVnd96x5b8EGOx4VKchHPqQhO-rd309iH',
    };

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'key=AAAAql75Hzc:APA91bHjN2iv42ZYYA_hDKVKEC3fhOKmmDsD36YQPA7WLJSiuQpP9xnZznsMuekHFj2Idkt25_SMTbnNN4kY3shHgD6fGBwiplfPSxfUcvIWHT3XHo4zYpkUexdSobQEtlUiyzjsoZ2m',
    };

    final response = await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'), headers: headers, body: jsonEncode(notificationData));

    if (response.statusCode == 200) {
      print('Notification sent successfully.');
    } else {
      print('Error sending notification: ${response.statusCode}');
    }
  }
  String notificationTitle = 'No Title';
  String notificationBody = 'No Body';

  @override
  void initState() {
    super.initState();
    saveDeviceToken();
    final _firebaseMessaging = FCM();
    _firebaseMessaging.setNotifications();

    _firebaseMessaging.bodyCtlr.stream.listen(_changeBody);
    _firebaseMessaging.titleCtlr.stream.listen(_changeTitle);
  }

  _changeBody(String msg) => setState(() => notificationBody = msg);
  _changeTitle(String msg) => setState(() => notificationTitle = msg);

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
