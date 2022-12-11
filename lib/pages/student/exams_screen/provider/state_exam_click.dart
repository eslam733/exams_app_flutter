import 'package:exams_app_flutter/helpers/routes_handler/material_navigation.dart';
import 'package:exams_app_flutter/model/exam_model.dart';
import 'package:exams_app_flutter/pages/student/single_exam/view/single_exam_screen.dart';
import 'package:exams_app_flutter/widgets/snackbar_helper.dart';

class StateExamClick {
  click(context, ExamModel examModel, bool solved) {
    if(solved) {
SnackBarHelper.showMySnakebar(context, 'Your has been solved before');
      return;
    }
    customPushNavigator(context, SingleExamScreen(examModel: examModel));
  }
}
