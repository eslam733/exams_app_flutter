import 'package:exams_app_flutter/model/add_exam_model.dart';
import 'package:flutter/material.dart';

import '../../../../../helpers/colors_data.dart';
import '../../../../../helpers/validations/validatetors.dart';
import '../../../../../widgets/default_text_field.dart';
import '../../provider/state_delete_answer_click.dart';
import '../../provider/state_set_correct_answer.dart';

class AnswerWidget extends StatelessWidget {
  final AddAnswerModel addAnswerModel;
  final String questionId;
  final bool selected;
  const AnswerWidget(
      {super.key,
      required this.addAnswerModel,
      required this.selected,
      required this.questionId});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: defaultTextField(
              controller: addAnswerModel.answer,
              textInputType: TextInputType.text,
              label: 'answer',
              borderColor: pinkColor,
              iconColor: Colors.green,
              validation: (val) =>
                  validateGenerail(context: context, value: val)),
        ),
         IconButton(
            onPressed: () => StateSetCorrectAnswerClick(context).set(questionId, addAnswerModel.id),
            icon:  Icon(
              Icons.done,
              color: selected ? Colors.green :greyColor,
            )),
        IconButton(
            onPressed: () => StateDeleteAnswerClick(context)
                .delete(questionId, addAnswerModel.id),
            icon: const Icon(
              Icons.delete,
              color: Colors.redAccent,
            ))
      ],
    );
  }
}
