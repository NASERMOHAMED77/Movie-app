
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginWithGoogle extends ChangeNotifier {
  final googlesingin = GoogleSignIn();
  GoogleSignInAccount? _user;
  GoogleSignInAccount? get user => _user;
  Future singinwithgoogle() async {
    final GoogleSignInAccount? googleuser = await googlesingin.signIn();
    if (googleuser == null) return;
    final googleAuth = await googleuser.authentication;
    final credential = await GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
    await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
