import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../../widgets/loader.dart';
import 'single_exam_helper.dart';

class StateSubmitClick {
  SingleExamProvider singleExamProvider = SingleExamProvider();
  StateSubmitClick(context) {
    singleExamProvider =
        Provider.of<SingleExamProvider>(context, listen: false);
  }

  click(context) async {
     Loaders.startLoading(context);
    await singleExamProvider.revision();
    await singleExamProvider.submitDegree();
     Loaders.endLoading(context);
    await singleExamProvider.showDegree(context);
    Navigator.pop(context);
  }
}
