import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery/routes/routes.dart';
import 'package:food_delivery/sign_screen/model/sign_model.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../home_screen/view/home_screen.dart';

class AuthPov extends ChangeNotifier {
  final FirebaseAuth _auth;

  AuthPov(this._auth);

  final FirebaseAuth _ath = FirebaseAuth.instance;

  Future<String> googleSignin(BuildContext context) async {
    try {
      final isLoged = await GoogleSignIn().isSignedIn();
      if (isLoged) GoogleSignIn().signOut();
      final result = await GoogleSignIn().signIn();
      if (result == null) {
        return Future.value('while error occured');
      }
      final cred = await result.authentication;
      final userProfile = await _ath.signInWithCredential(
        GoogleAuthProvider.credential(
          accessToken: cred.accessToken,
          idToken: cred.idToken,
        ),
      );
      final userDetail = userProfile.user;

      if (userProfile.additionalUserInfo!.isNewUser == true) {
        final userData = UserModel(
          name: userDetail!.displayName.toString(),
          email: userDetail.email.toString(),
          profile: userDetail.photoURL.toString(),
          verified: userDetail.emailVerified,
        );
        FirebaseFirestore.instance
            .collection('userProfile')
            .doc(userDetail.email)
            .set(
              userData.toSnapshot(),
            );
      }
      await saveUserData();
      Routes.pushreplace(screen: const HomeScreen());

      return Future.value('');
    } on FirebaseAuthException catch (ex) {
      return Future.value(ex.message);
    }
  }

  saveUserData() async {
    final obj = await SharedPreferences.getInstance();
    obj.setBool('userLoged', true);
  }

  logoutUser() async {
    await FirebaseAuth.instance.signOut();
    notifyListeners();
  }
  
}
