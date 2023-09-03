import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore_platform_interface/src/method_channel/method_channel_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:minerva/Controller/ChatService.dart';
import 'integration.dart';

import 'mockForFirebase.dart';
void main() {

  TestWidgetsFlutterBinding.ensureInitialized();
  setupCloudFirestoreMocks();
  MethodChannelFirebaseFirestore.channel = const MethodChannel(
    'plugins.flutter.io/firebase_firestore',
    StandardMethodCodec(TestFirestoreMessageCodec()),
  );

  TestDefaultBinaryMessengerBinding.instance?.defaultBinaryMessenger
      .setMockMethodCallHandler(MethodChannelFirebaseFirestore.channel,
          (call) async {
        return null;
      });
  setUpAll(() async {
    await Firebase.initializeApp();
  });

  test('Firebase testing', () async {
    String data = await ChatService().createChat('password', 'uid','uid2','uid3');
    print(data);
    expect(data.isNotEmpty, true);
  });
}

