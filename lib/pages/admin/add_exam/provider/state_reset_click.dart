import 'package:provider/provider.dart';

import 'add_exam_helper.dart';

class StateResetClick {
  AddExamProvider addExamProvider = AddExamProvider();
  StateResetClick(context) {
    addExamProvider = Provider.of<AddExamProvider>(context, listen: false);
  }

  reset() {
    addExamProvider.reset();
    addExamProvider.listen();
  }
}