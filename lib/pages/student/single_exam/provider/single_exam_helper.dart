import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exams_app_flutter/model/exam_model.dart';
import 'package:exams_app_flutter/providers/public_providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../view/widgets/dialogs/show_degree_diolog.dart';

class SingleExamProvider extends ChangeNotifier {
  late ExamModel examModel;
  int degree = 0;
  setExamModel(ExamModel exam) {
    examModel = exam;
  }

  setAnswerIdToQuestion(String questionId, String answerId) {
    for (var question in examModel.questions) {
      if (question.id == questionId) {
        question.answerId = answerId;
        break;
      }
    }
  }

  revision() {
    for (var question in examModel.questions) {
      if (question.correctAnswerId == question.answerId) {
        degree++;
      }
    }
  }

  submitDegree() async {
    CollectionReference<Map<String, dynamic>> exams =
        (FirebaseFirestore.instance.collection('exams'));
    QuerySnapshot<Map<String, dynamic>> examsSnapShot =
        await exams.where('id', isEqualTo: examModel.id).get();
    final ExamModel examSnapShotModel =
        ExamModel.fromJson(examsSnapShot.docs[0].data());
    examSnapShotModel.studentList!.add(StudentsModel(
        email: PublicProviders.googleLoginProvider.user!.email,
        degree: degree));

    await exams
        .doc(examsSnapShot.docs[0].id)
        .set(examSnapShotModel.toJson(), SetOptions(merge: true));
  }

  showDegree(context) async {
    await showDialog(
      builder: (context) {
        return ShowDegreeDialog(
          degree: degree.toString(),
          fullMark: examModel.questions.length.toString(),
        );
      },
      context: context,
    );
  }

  listen() {
    notifyListeners();
  }
}
