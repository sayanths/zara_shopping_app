import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery/home_screen/view_model/local_notification_service.dart';

class NotificationController extends ChangeNotifier {
  NotificationController() {
    getDeviceTokenToSendNotification();
    initialMessage();
    onMessage();
    messageWheNAppOpened();
  }

  String deviceTokenToSendPushNotification = '';
  Future<void> getDeviceTokenToSendNotification() async {
    final FirebaseMessaging fcm = FirebaseMessaging.instance;
    final token = await fcm.getToken();
    deviceTokenToSendPushNotification = token.toString();
    print("Token Value $deviceTokenToSendPushNotification");
  }

  Future<void> initialMessage() async {
    FirebaseMessaging.instance.getInitialMessage().then(
      (message) {
        print("FirebaseMessaging.instance.getInitialMessage");
        if (message != null) {
          print("New Notification");
        }
      },
    );
  }

  Future<void> onMessage() async {
    FirebaseMessaging.onMessage.listen((message) {
      print("firebase messaging.listen");
      if (message.notification != null) {
        print(message.notification!.title);
        print(message.notification!.body);
        print("message detail ${message.data}");
        LocalNotificationService.createAndDisplayNotification(message);
      }
    });
  }

  Future<void> messageWheNAppOpened() async {
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      if (message.notification != null) {
        print(message.notification!.title);
        print(message.notification!.body);
        print(("message data ${message.data['_id']}"));
      }
    });
  }
}
