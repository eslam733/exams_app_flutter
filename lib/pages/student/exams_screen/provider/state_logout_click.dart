import 'package:provider/provider.dart';

import 'exams_student_helper.dart';

class StateLogoutClick {
  ExamsStudentProvider examsStudentProvider = ExamsStudentProvider();
  StateLogoutClick(context) {
    examsStudentProvider = Provider.of<ExamsStudentProvider>(context, listen: false);
  }
  logout(context) {
    examsStudentProvider.logout(context);
  }
}
