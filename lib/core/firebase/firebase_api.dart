import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:test_app/core/config/app_logger.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
    logger.i('Title : ${message.notification!.title}');
    logger.i('Body : ${message.notification!.body}');
    logger.i('Payload : ${message.data}');

 
}

class FirebaseApi {
  final firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await firebaseMessaging.requestPermission();
    final FCMToken = await firebaseMessaging.getToken();
    logger.i('Token : $FCMToken');

    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    });
  }
}
