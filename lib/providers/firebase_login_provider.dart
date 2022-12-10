import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../widgets/snackbar_helper.dart';

class FirebaseLoginProvider extends ChangeNotifier {
  static final firebaseLoginProvider = Provider.of<FirebaseLoginProvider>(
      Exams.navigatorKey.currentState!.context,
      listen: false);
  User? _user;
  User? get user => _user;
  void logout() async {
    await FirebaseAuth.instance.signOut();
  }

  resetPassword(email) {
    FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  bool ifLogin() {
    _user = FirebaseAuth.instance.currentUser;
    if (_user != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> login(String email, String password) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      _user = userCredential.user;
      notifyListeners();
      return true;
    } catch (err) {
      print(err);
      logout();
      SnackBarHelper.showMySnakebar(Exams.navigatorKey.currentState!.context,
          'Email or password incorrect');
      return false;
    }
  }
}
