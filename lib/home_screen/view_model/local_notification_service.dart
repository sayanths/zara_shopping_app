//mele okke youtube channnel pole pop ponthi local notification veran vendit



import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  //method to initizalize localnotification

  static void initialize(BuildContext context) {
    //initalzations settings for android
    InitializationSettings initializationSettings =
        const InitializationSettings(
            android: AndroidInitializationSettings("@mipmap/ic_launcher"));
    _notificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: (String? id) async {
        print("onSelectNotification");
        if (id!.isNotEmpty) {
          print("router value $id");
        }
      },
    );
  }

  //after initalization create channel in createandisplayNotification method

  static void createAndDisplayNotification(RemoteMessage message) async {
    try {
      final id = DateTime.now().microsecondsSinceEpoch ~/ 1000;
      const NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
          "pushnotificationapp",
          "pushnotificationappchannel",
          importance: Importance.max,
          playSound: true,
          priority: Priority.high,
        ),
      );
      await _notificationsPlugin.show(id, message.notification!.title,
          message.notification!.body, notificationDetails,
          payload: message.data['_id']);
    } on Exception catch (e) {
      print(e);
    }
  }
}
