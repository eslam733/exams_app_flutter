import 'package:provider/provider.dart';

import 'add_exam_helper.dart';

class StateAddQuestions {
  AddExamProvider addExamProvider = AddExamProvider();
  StateAddQuestions(context) {
    addExamProvider = Provider.of<AddExamProvider>(context, listen: false);
  }

  addQuestions() {
    addExamProvider.addQuestions();
    addExamProvider.listen();
  }
}
