import 'package:flutter/foundation.dart';

class ExamModel {
  String id;
  final String name;
  final List<QuestionModel> questions;

  List<String>? studentList = []; // emails students aready taken this exam

  ExamModel({
    required this.name,
    required this.questions,
    required this.id,
    this.studentList,
  });

  factory ExamModel.fromJson(Map<String, dynamic> json) => ExamModel(
        name: json["name"],
        id: json["id"],
        studentList: List<String>.from(json["studentList"]).toList(),
        questions: List<QuestionModel>.from(
            json['questions'].map((e) => QuestionModel.fromJson(e))).toList(),
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['studentList'] = [];
    data['questions'] =
        List<dynamic>.from(questions.map((e) => e.toJson())).toList();
    return data;
  }
}

class QuestionModel {
  final String id;
  final String title;
  final List<AnswerModel> anwsers;
  final String correctAnswerId;
  String? answerId = '-1';

  QuestionModel({
    required this.anwsers,
    required this.id,
    this.answerId,
    required this.correctAnswerId,
    required this.title,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
        title: json["title"],
        id: json["id"],
        correctAnswerId: json["correctAnswerId"],
        anwsers: List<AnswerModel>.from(
            json['anwsers'].map((e) => AnswerModel.fromJson(e))).toList(),
      );
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['correctAnswerId'] = correctAnswerId;
    data['anwsers'] =
        List<dynamic>.from(anwsers.map((e) => e.toJson())).toList();
    return data;
  }
}

class AnswerModel {
  final String id;
  final String answer;
  AnswerModel({required this.answer, required this.id});

  factory AnswerModel.fromJson(Map<String, dynamic> json) => AnswerModel(
        answer: json["answer"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['answer'] = answer;
    return data;
  }
}
