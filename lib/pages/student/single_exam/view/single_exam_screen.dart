import 'package:exams_app_flutter/helpers/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../../../helpers/colors_data.dart';
import '../../../../helpers/font_manager.dart';
import '../../../../helpers/styles_manager.dart';
import '../../../../model/exam_model.dart';
import '../../../../widgets/default_button.dart';
import '../../../../widgets/text_divider_widget.dart';
import '../provider/single_exam_helper.dart';
import '../provider/state_submit_click.dart';
import 'widgets/questions_widget.dart';

class SingleExamScreen extends StatefulWidget {
  final ExamModel examModel;
  const SingleExamScreen({super.key, required this.examModel});

  @override
  State<SingleExamScreen> createState() => _SingleExamScreenState();
}

class _SingleExamScreenState extends State<SingleExamScreen> {
  @override
  void initState() {
    super.initState();
    // sure screen is build
    if (mounted) {
      // pass exam model to provider
      Provider.of<SingleExamProvider>(context, listen: false)
          .setExamModel(widget.examModel);
    }
  }

  @override
  Widget build(BuildContext context) {
    final singleExamProvider = Provider.of<SingleExamProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.examModel.name,
          style: getBoldStyle(color: white, fontSize: FontSize.s20),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p26),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const TextDividerWidget(
              title: 'Question 1',
            ),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => QuestionsStduentWidget(
                  questionModel: singleExamProvider.examModel.questions[index]),
              separatorBuilder: (context, index) => TextDividerWidget(
                title: 'Question ${index + 2}',
              ),
              itemCount: singleExamProvider.examModel.questions.length,
            ),
            const SizedBox(
              height: 10,
            ),
            DefaultButton(
              textColor: white,
              text: 'Submit',
              function: () => StateSubmitClick(context).click(context),
              color: pinkColor,
            )
          ],
        ),
      )),
    );
  }
}
