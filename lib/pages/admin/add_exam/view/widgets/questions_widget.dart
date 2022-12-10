import 'package:exams_app_flutter/helpers/styles_manager.dart';
import 'package:exams_app_flutter/model/add_exam_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../../helpers/colors_data.dart';
import '../../../../../helpers/validations/validatetors.dart';
import '../../../../../widgets/default_text_field.dart';
import '../../provider/state_add_answer_click.dart';
import 'answer_widget.dart';

class QuestionsWidget extends StatelessWidget {
  final AddQuestionModel addQuestionModel;
  const QuestionsWidget({super.key, required this.addQuestionModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            Expanded(
              child: defaultTextField(
                controller: addQuestionModel.title,
                textInputType: TextInputType.text,
                label: 'Question',
                borderColor: pinkColor,
                iconColor: pinkColor,
                validation: (val) =>
                    validateGenerail(context: context, value: val),
              ),
            ),
            IconButton(
                onPressed: () =>
                    StateAddAnswerClick(context).add(addQuestionModel.id),
                icon: Icon(
                  Icons.add,
                  color: pinkDarkColor,
                ))
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Answers',
          style: getRegularStyle(color: lightGreyColor),
        ),
        const SizedBox(
          height: 10,
        ),
        ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => AnswerWidget(
                questionId: addQuestionModel.id,
                addAnswerModel: addQuestionModel.anwsers[index],
                selected: addQuestionModel.anwsers[index].id ==
                    addQuestionModel.correctAnswerId),
            separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
            itemCount: addQuestionModel.anwsers.length)
      ]),
    );
  }
}
