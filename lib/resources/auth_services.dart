import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zoom/utilits/snak_bar.dart';

class AuthModels {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<User?> get authChange => _auth.authStateChanges();

  User get user=>_auth.currentUser!;

  Future<bool> signInWithGoogle(BuildContext context) async {
    bool result = false;
    try {
      final GoogleSignInAccount? account = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? authentication =
          await account?.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: authentication?.accessToken,
          idToken: authentication?.idToken);

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      User? user = userCredential.user;
      if (user != null) {
        if (userCredential.additionalUserInfo!.isNewUser) {
          await _firestore.collection("users").doc(user.uid).set({
            "username": user.displayName,
            "uid": user.uid,
            "profile_photo": user.photoURL
          });
        }
        result = true;
        return result;
      }
    } on FirebaseAuthException catch (e) {
      showSnakBar(context, e.message ?? e.toString());
      print(e);
    }
    return result;
  }

  signOut() async {
    await _auth.signOut();
  }
}
