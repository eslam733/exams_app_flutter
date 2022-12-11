import 'package:exams_app_flutter/helpers/styles_manager.dart';
import 'package:exams_app_flutter/model/add_exam_model.dart';
import 'package:exams_app_flutter/model/exam_model.dart';
import 'package:exams_app_flutter/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../../helpers/colors_data.dart';
import '../../../../../helpers/validations/validatetors.dart';
import '../../../../../widgets/default_text_field.dart';
import 'answer_widget.dart';

class QuestionsStduentWidget extends StatelessWidget {
  final QuestionModel questionModel;
  const QuestionsStduentWidget({super.key, required this.questionModel});

  @override
  Widget build(BuildContext context) {
    final questionController = TextEditingController();
    questionController.text = questionModel.title;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        children: [
          Expanded(
            child: defaultTextField(
              controller: questionController,
             
              textInputType: TextInputType.text,
              label: questionModel.title,
              readOnly: true,
              enabled: false,
              borderColor: pinkColor,
              iconColor: pinkColor,
              validation: (val) =>
                  validateGenerail(context: context, value: val),
            ),
          ),
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
          itemBuilder: (context, index) => AnswerStudentWidget(
            questionId: questionModel.id,
              answerModel: questionModel.anwsers[index],
              selected:
                  questionModel.anwsers[index].id == questionModel.answerId),
          separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
          itemCount: questionModel.anwsers.length),
          
    ]);
  }
}
