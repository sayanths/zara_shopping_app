import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/home_screen/view_model/local_notification_service.dart';
import 'package:food_delivery/home_screen/view_model/product_controller.dart';
import 'package:food_delivery/home_screen/view_model/user_provider.dart';
import 'package:food_delivery/review_cart/view_model/review_cart_controller.dart';
import 'package:food_delivery/routes/routes.dart';
import 'package:food_delivery/sign_screen/viewmodel/auth_pov.dart';
import 'package:food_delivery/splash_screen/view/splash_screen.dart';
import 'package:food_delivery/splash_screen/viewmodel/splash_pov.dart';
import 'package:provider/provider.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';

import 'home_screen/view_model/notification.dart';

Future<void> backGroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // options: const FirebaseOptions(
      //   apiKey: 'apiKey',
      //   appId: 'appId',
      //   messagingSenderId: 'messagingSenderId',
      //   projectId: 'projectId',
      // ),

      );
  FirebaseMessaging.onBackgroundMessage(backGroundHandler);
  LocalNotificationService.initialize;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SplashPov>(create: (context) => SplashPov()),
        ChangeNotifierProvider<AuthPov>(
            create: (context) => AuthPov(FirebaseAuth.instance)),
        ChangeNotifierProvider<ProductRespository>(
            create: (context) => ProductRespository()),
        ChangeNotifierProvider<UserProvider>(
            create: (context) => UserProvider()),
        ChangeNotifierProvider<ReviewCartController>(
            create: (context) => ReviewCartController()),
        ChangeNotifierProvider<NotificationController>(
            create: (context) => NotificationController()),
      ],
      child: MaterialApp(
        navigatorKey: Routes.navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'Zara',
        home: const SplashScreen(),
      ),
    );
  }
}
