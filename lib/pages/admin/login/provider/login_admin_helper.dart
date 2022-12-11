import 'package:exams_app_flutter/helpers/routes_handler/material_navigation.dart';
import 'package:exams_app_flutter/pages/admin/exams_page/view/exams_screen.dart';
import 'package:exams_app_flutter/providers/public_providers.dart';
import 'package:flutter/cupertino.dart';

class LoginAdminProvider extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final keyForm = GlobalKey<FormState>();

  bool isPassword = true;

  changePasswordVisiabltiy() {
    isPassword = !isPassword;
    listen();
  }

  login(context) async {
    if (!keyForm.currentState!.validate()) return;
    final res = await PublicProviders.firebaseLoginProvider
        .login(emailController.text, passwordController.text);
    // final res = await  PublicProviders.firebaseLoginProvider
    //     .login('admin@gmail.com', '123456');

    if (res) {
      customPushAndRemoveUntil(context, ExamsScreen());
    }
  }

  listen() {
    notifyListeners();
  }
}
