import 'package:exams_app_flutter/pages/admin/login/provider/login_admin_helper.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../pages/admin/add_exam/provider/add_exam_helper.dart';
import '../pages/admin/exams_page/provider/exams_helper.dart';
import '../pages/splash/provider/splash_helper.dart';
import 'firebase_login_provider.dart';

List<SingleChildWidget> providers = [
  // splash
  ChangeNotifierProvider.value(value: SplashProvider()),

  // firebase login
  ChangeNotifierProvider.value(value: FirebaseLoginProvider()),

  // admin
  ChangeNotifierProvider.value(value: LoginAdminProvider()),
  ChangeNotifierProvider.value(value: ExamsProvider()),
  ChangeNotifierProvider.value(value: AddExamProvider()),
];
