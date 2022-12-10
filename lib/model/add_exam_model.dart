import 'package:flutter/cupertino.dart';

class AddExamModel {
  final String id;
  final TextEditingController name = TextEditingController();
  final List<AddQuestionModel> questions = [AddQuestionModel(id: '1')];

  AddExamModel({required this.id});

}

class AddQuestionModel {
  final String id;
  final TextEditingController title = TextEditingController();
  final List<AddAnswerModel> anwsers = [
    AddAnswerModel(id: '1'),
    AddAnswerModel(id: '2'),
    AddAnswerModel(id: '3')
  ];
  String correctAnswerId = '1';

  AddQuestionModel({
    required this.id,
  });
}

class AddAnswerModel {
  final String id;
  final TextEditingController answer = TextEditingController();
  AddAnswerModel({required this.id});
}
