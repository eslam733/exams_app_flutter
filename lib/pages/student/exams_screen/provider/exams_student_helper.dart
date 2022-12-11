import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exams_app_flutter/helpers/routes_handler/material_navigation.dart';
import 'package:exams_app_flutter/model/exam_model.dart';
import 'package:exams_app_flutter/pages/welcome_page/view/welcome_screen.dart';
import 'package:exams_app_flutter/providers/public_providers.dart';
import 'package:flutter/cupertino.dart';

class ExamsStudentProvider extends ChangeNotifier {
  logout(context) async {
    PublicProviders.googleLoginProvider.googleLogout();
    customPushAndRemoveUntil(context, WelcomeScreen());
  }

  List<ExamModel> exams = [];
  bool isLoading = true;

  getExams() async {
    isLoading = true;
    exams.clear();
    QuerySnapshot<Map<String, dynamic>> examsSnapShot =
        await FirebaseFirestore.instance.collection('exams').get();

    for (var doc in examsSnapShot.docs) {
      exams.add(ExamModel.fromJson(doc.data()));
    }
    isLoading = false;
    listen();
  }

  // return -1 if not solve exam
  String getDegree(String examId) {
    String degree = '-1';
    for (var exam in exams) {
      if (exam.id == examId) {
        for (var student in exam.studentList!) {
          if (student.email ==
              PublicProviders.googleLoginProvider.user!.email) {
            degree = student.degree.toString();
            break;
          }
        }
      }
    }

    return degree;
  }

  listen() {
    notifyListeners();
  }
}
