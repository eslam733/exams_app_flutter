import 'package:exams_app_flutter/helpers/routes_handler/material_navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../widgets/loader.dart';
import '../view/widgets/dialogs/exam_saved_diolog.dart';
import 'add_exam_helper.dart';

class StateSaveClick {
  AddExamProvider addExamProvider = AddExamProvider();
  StateSaveClick(context) {
    addExamProvider = Provider.of<AddExamProvider>(context, listen: false);
  }

  save(context) async {
    Loaders.startLoading(context);
    final res = await addExamProvider.saveExam(context);
    Loaders.endLoading(context);
    addExamProvider.reset();
    if (res) {
      showDialog(
        builder: (context) {
          return const ExamSavedSuccess();
        },
        context: context,
      );
    }
    addExamProvider.listen();
  }
}
