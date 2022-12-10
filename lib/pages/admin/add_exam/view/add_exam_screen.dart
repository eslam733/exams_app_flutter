import 'package:exams_app_flutter/helpers/values_manager.dart';
import 'package:exams_app_flutter/pages/admin/add_exam/provider/add_exam_helper.dart';
import 'package:exams_app_flutter/pages/admin/add_exam/provider/state_save_click.dart';
import 'package:exams_app_flutter/pages/admin/add_exam/view/widgets/questions_widget.dart';
import 'package:exams_app_flutter/widgets/default_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../helpers/colors_data.dart';
import '../../../../helpers/font_manager.dart';
import '../../../../helpers/styles_manager.dart';
import '../../../../helpers/validations/validatetors.dart';
import '../../../../widgets/text_divider_widget.dart';
import '../provider/state_add_question_click.dart';
import '../provider/state_reset_click.dart';

class AddExamScreen extends StatefulWidget {
  const AddExamScreen({super.key});

  @override
  State<AddExamScreen> createState() => _AddExamScreenState();
}

class _AddExamScreenState extends State<AddExamScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final addExamProvider = Provider.of<AddExamProvider>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => StateResetClick(context).reset(),
        backgroundColor: darkShadow,
        child: const Icon(Icons.refresh_sharp),
      ),
      appBar: AppBar(
        title: Text(
          'Add Exam',
          style: getBoldStyle(color: white, fontSize: FontSize.s20),
        ),
        actions: [
          InkWell(
            onTap: () => StateSaveClick(context).save(context),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'save',
                    style:
                        getRegularStyle(color: white, fontSize: FontSize.s17),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p26),
        child: Form(
          key: addExamProvider.formKey,
          child: Column(children: [
            const SizedBox(
              height: 20,
            ),
            defaultTextField(
                controller: addExamProvider.addExamModel.name,
                textInputType: TextInputType.text,
                label: 'Exam name',
                borderColor: pinkColor,
                iconColor: pinkColor,
                validation: (val) {
                  if (val.toString().isEmpty) {
                    return 'Exam name can\'t not be empty';
                  }
                  return null;
                }),
            const SizedBox(
              height: 10,
            ),
            const TextDividerWidget(
              title: 'Question 1',
            ),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => QuestionsWidget(
                  addQuestionModel:
                      addExamProvider.addExamModel.questions[index]),
              separatorBuilder: (context, index) => TextDividerWidget(
                title: 'Question ${index + 2}',
              ),
              itemCount: addExamProvider.addExamModel.questions.length,
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () => StateAddQuestions(context).addQuestions(),
              child: Container(
                  padding: const EdgeInsets.all(AppPadding.p14),
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: pinkColor),
                  child: Icon(
                    Icons.add,
                    color: white,
                  )),
            )
          ]),
        ),
      )),
    );
  }
}
