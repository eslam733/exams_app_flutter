import 'package:exams_app_flutter/model/exam_model.dart';

class DataFile {
  static final List<ExamModel> exams = [
    ExamModel(
      id: '1',
      name: 'test 1',
      studentList: ['emohamef733@gmail.com'],
      questions: [
        QuestionModel(
          title: 'question 1?',
          anwsers: [
            AnswerModel(answer: 'answer 1', id: '1'),
            AnswerModel(answer: 'answer 1', id: '2'),
            AnswerModel(answer: 'answer 1', id: '3'),
            AnswerModel(answer: 'answer 1', id: '4'),
            AnswerModel(answer: 'answer 1', id: '5'),
          ],
          correctAnswerId: '1',
          id: '1',
        )
      ],
    ),
    ExamModel(
           id: '1',
      name: 'test 2',
      studentList: ['emohamef733@gmail.com'],
      questions: [
        QuestionModel(
          title: 'question 1?',
          anwsers: [
            AnswerModel(answer: 'answer 1', id: '1'),
            AnswerModel(answer: 'answer 1', id: '2'),
            AnswerModel(answer: 'answer 1', id: '3'),
            AnswerModel(answer: 'answer 1', id: '4'),
            AnswerModel(answer: 'answer 1', id: '5'),
          ],
          correctAnswerId: '1',
          id: '1',
        )
      ],
    ),
    ExamModel(
           id: '1',
      name: 'test 3',
      studentList: ['emohamef733@gmail.com'],
      questions: [
        QuestionModel(
          title: 'question 1?',
          anwsers: [
            AnswerModel(answer: 'answer 1', id: '1'),
            AnswerModel(answer: 'answer 1', id: '2'),
            AnswerModel(answer: 'answer 1', id: '3'),
            AnswerModel(answer: 'answer 1', id: '4'),
            AnswerModel(answer: 'answer 1', id: '5'),
          ],
          correctAnswerId: '1',
          id: '1',
        )
      ],
    ),
  ];
}
