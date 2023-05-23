import 'dart:developer';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepo {
  Future<User?> login() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  final userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
    if(userCredential.user!=null){
      log("User received!", name: "USER AUTH");
    }
    return userCredential.user;
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }
}