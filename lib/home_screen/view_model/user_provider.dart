import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier {
  void addUserData({required User currentUser,String? userName,String? userEmail,String? userImage,} ) async{
   await FirebaseFirestore.instance.collection('userProfile').doc(currentUser.uid).set({
   "userName":userName,
   "userEmail":userEmail,
   "userImage":userImage,
   "userId":currentUser.uid,
    });
  }
}
