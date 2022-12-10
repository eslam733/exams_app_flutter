import 'package:exams_app_flutter/helpers/routes_handler/material_navigation.dart';

import '../../admin/login/view/login_admin_screen.dart';

class StateAdminClick {
  adminClick(context) {
    customPushNavigator(context,  LoginAdminScreen());
  }
}