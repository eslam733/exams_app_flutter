import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exams_app_flutter/model/exam_model.dart';
import 'package:flutter/cupertino.dart';

import '../../../../helpers/common_methods.dart';
import '../../../../model/add_exam_model.dart';
import '../../../../widgets/loader.dart';

class AddExamProvider extends ChangeNotifier {
  late AddExamModel addExamModel;
  final formKey = GlobalKey<FormState>();

  AddExamProvider() {
    reset();
  }

  addQuestions() {
    addExamModel.questions.add(AddQuestionModel(
        id: '${int.parse(addExamModel.questions.last.id) + 1}'));
  }

  addAnswer(String questionId) {
    for (var question in addExamModel.questions) {
      if (question.id == questionId) {
        if (question.anwsers.length < 5) {
          question.anwsers.add(
              AddAnswerModel(id: '${int.parse(question.anwsers.last.id) + 1}'));
          break;
        }
      }
    }
  }

  deleteAnswer(String questionId, String answerId) {
    for (var question in addExamModel.questions) {
      if (question.id == questionId) {
        question.anwsers.removeWhere((element) => element.id == answerId);
        break;
      }
    }
  }

  setCorrectAnswer(String questionId, String answerId) {
    for (var question in addExamModel.questions) {
      if (question.id == questionId) {
        question.correctAnswerId = answerId;
        break;
      }
    }
  }

  Future<bool> saveExam(context) async {
    if (!formKey.currentState!.validate()) return false;
    ExamModel examModel = convertToExamModel();

    await FirebaseFirestore.instance
        .collection('exams')
        .add(examModel.toJson());

    return true;
  }

  ExamModel convertToExamModel() {
    ExamModel examModel = ExamModel(
        id: generateRandomString(),
        name: addExamModel.name.text,
        questions: []);
    for (var question in addExamModel.questions) {
      examModel.questions.add(QuestionModel(
          anwsers: question.anwsers
              .map((answer) =>
                  AnswerModel(answer: answer.answer.text, id: answer.id))
              .toList(),
          id: question.id,
          correctAnswerId: question.correctAnswerId,
          title: question.title.text));
    }
    return examModel;
  }

  reset() {
    addExamModel = AddExamModel(id: '1');
  }

  listen() {
    notifyListeners();
  }
}
