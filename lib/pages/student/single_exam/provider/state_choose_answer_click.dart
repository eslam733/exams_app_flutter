import 'package:provider/provider.dart';

import 'single_exam_helper.dart';

class StateChooseAnswerClick {
  SingleExamProvider singleExamProvider = SingleExamProvider();
  StateChooseAnswerClick(context) {
    singleExamProvider =
        Provider.of<SingleExamProvider>(context, listen: false);
  }
  choose(String questionId, String answerId) {
    singleExamProvider.setAnswerIdToQuestion(questionId, answerId);
    singleExamProvider.listen();
  }
}
