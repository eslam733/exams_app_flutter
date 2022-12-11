import 'package:exams_app_flutter/helpers/routes_handler/material_navigation.dart';
import 'package:exams_app_flutter/main.dart';
import 'package:exams_app_flutter/pages/admin/exams_page/view/exams_screen.dart';
import 'package:exams_app_flutter/pages/admin/login/provider/login_admin_helper.dart';
import 'package:exams_app_flutter/pages/admin/login/view/login_admin_screen.dart';
import 'package:exams_app_flutter/pages/welcome_page/view/welcome_screen.dart';
import 'package:exams_app_flutter/providers/public_providers.dart';
import 'package:flutter/cupertino.dart';

import '../../student/exams_screen/view/exams_screen.dart';

class SplashProvider extends ChangeNotifier {
  SplashProvider();

  // check all needed resource before app started
  checkStartUp(context) async {
    bool res = false;
    res = await checkLoginFirebase(context);
    res = await checkGoogleLogin(context) || res;

    if (!res) {
      customPushAndRemoveUntil(context, WelcomeScreen());
    }
  }

  Future<bool> checkLoginFirebase(context) async {
    final res = PublicProviders.firebaseLoginProvider.ifLogin();

    if (res) {
      customPushAndRemoveUntil(context, ExamsScreen());
    }

    return res;
  }

  Future<bool> checkGoogleLogin(context) async {
    final res = await PublicProviders.googleLoginProvider.ifLogin();

    if (res) {
      customPushAndRemoveUntil(context, ExamsStudentScreen());
    }

    return res;
  }
}
