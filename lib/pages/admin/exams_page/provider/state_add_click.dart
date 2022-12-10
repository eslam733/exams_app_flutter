import 'package:exams_app_flutter/helpers/routes_handler/material_navigation.dart';

import '../../add_exam/view/add_exam_screen.dart';

class StateAddClick {
  add(context) {
    customPushNavigator(context, AddExamScreen());
  }
}