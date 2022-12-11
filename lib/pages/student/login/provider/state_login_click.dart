import 'package:exams_app_flutter/helpers/routes_handler/material_navigation.dart';
import 'package:exams_app_flutter/widgets/snackbar_helper.dart';
import 'package:provider/provider.dart';

import '../../exams_screen/view/exams_screen.dart';
import 'login_helper.dart';

class StateLoginClick {
  LoginStudetProvider loginStudetProvider = LoginStudetProvider();
  StateLoginClick(context) {
    loginStudetProvider =
        Provider.of<LoginStudetProvider>(context, listen: false);
  }

  login(context) async {
    final res = await loginStudetProvider.loginGoogle();
    if (res) {
      await loginStudetProvider.updateUserData();
      customPushAndRemoveUntil(context, ExamsStudentScreen());
    } else {
      SnackBarHelper.showMySnakebar(context, 'Problem with signin');
    }
  }
}
