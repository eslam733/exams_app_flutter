import 'package:provider/provider.dart';

import 'add_exam_helper.dart';

class StateDeleteAnswerClick {
  AddExamProvider addExamProvider = AddExamProvider();
  StateDeleteAnswerClick(context) {
    addExamProvider = Provider.of<AddExamProvider>(context, listen: false);
  }

  delete(String questionId, String answerId) {
    addExamProvider.deleteAnswer(questionId, answerId);
    addExamProvider.listen();
  }
}
