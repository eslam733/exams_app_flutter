import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../widgets/snackbar_helper.dart';


class GoogleProvider extends ChangeNotifier {
  static final googleProvider = Provider.of<GoogleProvider>(
      Exams.navigatorKey.currentState!.context,
      listen: false);
  final googleSinIn = GoogleSignIn();

  GoogleSignInAccount? _user;
  GoogleSignInAccount? get user => _user;

  void googleLogout() async {
    googleSinIn.disconnect();
    googleSinIn.signOut();
  }

  Future<bool> ifLogin() async {
    bool res = await googleSinIn.isSignedIn();
    
    if (res) {
      _user = await googleSinIn.signIn();
      return true;
    } else {
      return false;
    }
  }

  Future googleLogin() async {
    try {
      final googleUser = await googleSinIn.signIn();
      // if (googleUser == null) {
      //   googleLogout();
      //   return;
      // }

      _user = googleUser;
      final googleAutn = await googleUser!.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAutn.accessToken, idToken: googleAutn.idToken);

      await FirebaseAuth.instance.signInWithCredential(credential);
      notifyListeners();
    } catch (err) {
      SnackBarHelper.showMySnakebar(Exams.navigatorKey.currentState!.context,
          'Email or password incrooect');
      print(err);
      googleLogout();
    }
  }
}
