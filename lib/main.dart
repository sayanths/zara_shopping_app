import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/home_screen/model/home_model.dart';
import 'package:food_delivery/home_screen/view/home_screen.dart';
import 'package:food_delivery/home_screen/view_model/product_controller.dart';
import 'package:food_delivery/home_screen/view_model/user_provider.dart';
import 'package:food_delivery/routes/routes.dart';
import 'package:food_delivery/search_screen/view_model/search_controller.dart';
import 'package:food_delivery/sign_screen/model/sign_screen.dart';
import 'package:food_delivery/sign_screen/viewmodel/auth_pov.dart';

import 'package:food_delivery/splash_screen/viewmodel/splash_pov.dart';
import 'package:provider/provider.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
       ChangeNotifierProvider<ProductRespository>(create: (context) => ProductRespository()),
       ChangeNotifierProvider<UserProvider>(create: (context) => UserProvider()),
      ],
      child: MaterialApp(
        navigatorKey: Routes.navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'Zara',
        home: const HomeScreen(),
      ),
    );
  }
}
