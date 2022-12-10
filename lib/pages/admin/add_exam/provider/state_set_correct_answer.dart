import 'package:provider/provider.dart';

import 'add_exam_helper.dart';

class StateSetCorrectAnswerClick {
  AddExamProvider addExamProvider = AddExamProvider();
  StateSetCorrectAnswerClick(context) {
    addExamProvider = Provider.of<AddExamProvider>(context, listen: false);
  }

  set(String questionId, String answerId) {
    addExamProvider.setCorrectAnswer(questionId, answerId);
    addExamProvider.listen();
  }
}
