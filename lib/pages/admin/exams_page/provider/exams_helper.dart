import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exams_app_flutter/helpers/data_file.dart';
import 'package:exams_app_flutter/model/exam_model.dart';
import 'package:flutter/cupertino.dart';

class ExamsProvider extends ChangeNotifier {
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

  listen() {
    notifyListeners();
  }
}
