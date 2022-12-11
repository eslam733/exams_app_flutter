import 'package:exams_app_flutter/model/add_exam_model.dart';
import 'package:exams_app_flutter/model/exam_model.dart';
import 'package:flutter/material.dart';

import '../../../../../helpers/colors_data.dart';
import '../../../../../helpers/validations/validatetors.dart';
import '../../../../../widgets/default_text_field.dart';
import '../../provider/state_choose_answer_click.dart';

class AnswerStudentWidget extends StatelessWidget {
  final String questionId;
 final AnswerModel answerModel;
 final bool selected;
  const AnswerStudentWidget(
      {super.key,
      required this.questionId,
      required this.selected,
      required this.answerModel
      });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: defaultTextField(
            enabled: false,
              controller: TextEditingController(),
              textInputType: TextInputType.text,
              label: answerModel.answer,
              borderColor: pinkColor,
              iconColor: Colors.green,
              validation: (val) =>
                  validateGenerail(context: context, value: val)),
        ),
         IconButton(
            onPressed: () => StateChooseAnswerClick(context).choose(questionId, answerModel.id),
            icon:  Icon(
              Icons.done,
              color: selected ? Colors.green : Colors.grey[300],
            )),
    
      ],
    );
  }
}
