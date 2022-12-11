import 'package:exams_app_flutter/helpers/routes_handler/material_navigation.dart';

import '../../student/login/view/login_student_screen.dart';

class StateStudentClick {
  studentClick(context) {
    customPushNavigator(context,  LoginStudentScreen());
  }
}