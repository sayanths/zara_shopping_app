import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery/home_screen/view_model/user_provider.dart';
import 'package:food_delivery/routes/routes.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

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
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: cred.accessToken,
        idToken: cred.idToken,
      );
      final User? user = (await _ath.signInWithCredential(credential)).user;

      //used to get the data from the user and to display it in the place like login screen etc
      context.read<UserProvider>().addUserData(
            currentUser: user!,
            userName: user.displayName,
            userEmail: user.email,
            userImage: user.photoURL,
          );

      Routes.push(screen: const HomeScreen());

      return Future.value('');
    } on FirebaseAuthException catch (ex) {
      return Future.value(ex.message);
    }
  }
}
