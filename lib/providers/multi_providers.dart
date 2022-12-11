import 'package:exams_app_flutter/pages/admin/login/provider/login_admin_helper.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../pages/admin/add_exam/provider/add_exam_helper.dart';
import '../pages/admin/exams_page/provider/exams_helper.dart';
import '../pages/splash/provider/splash_helper.dart';
import '../pages/student/exams_screen/provider/exams_student_helper.dart';
import '../pages/student/login/provider/login_helper.dart';
import '../pages/student/single_exam/provider/single_exam_helper.dart';
import 'firebase_login_provider.dart';
import 'google_provider.dart';

List<SingleChildWidget> providers = [
  // splash
  ChangeNotifierProvider.value(value: SplashProvider()),

  // firebase login
  ChangeNotifierProvider.value(value: FirebaseLoginProvider()),
  // google login
  ChangeNotifierProvider.value(value: GoogleProvider()),

  // admin
  ChangeNotifierProvider.value(value: LoginAdminProvider()),
  ChangeNotifierProvider.value(value: ExamsProvider()),
  ChangeNotifierProvider.value(value: AddExamProvider()),

  // studnet
  ChangeNotifierProvider.value(value: SingleExamProvider()),
  ChangeNotifierProvider.value(value: LoginStudetProvider()),
  ChangeNotifierProvider.value(value: ExamsStudentProvider()),
];
