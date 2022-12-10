import 'package:exams_app_flutter/helpers/routes_handler/material_navigation.dart';
import 'package:exams_app_flutter/pages/welcome_page/view/welcome_screen.dart';
import 'package:exams_app_flutter/providers/multi_providers.dart';
import 'package:exams_app_flutter/providers/public_providers.dart';

class StateLogoutClick {
  logout(context) async {
     PublicProviders.firebaseLoginProvider.logout();
     customPushAndRemoveUntil(context, WelcomeScreen());
  }
}