import 'package:provider/provider.dart';

import 'add_exam_helper.dart';

class StateAddAnswerClick {
  AddExamProvider addExamProvider = AddExamProvider();
  StateAddAnswerClick(context) {
    addExamProvider = Provider.of<AddExamProvider>(context, listen: false);
  }

  add(String questionId) {
    addExamProvider.addAnswer(questionId);
    addExamProvider.listen();
  }
}
