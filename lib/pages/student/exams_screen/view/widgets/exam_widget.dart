import 'package:exams_app_flutter/model/exam_model.dart';
import 'package:exams_app_flutter/providers/public_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../helpers/colors_data.dart';
import '../../../../../helpers/font_manager.dart';
import '../../../../../helpers/styles_manager.dart';
import '../../../../../helpers/values_manager.dart';
import '../../provider/exams_student_helper.dart';
import '../../provider/state_exam_click.dart';

class ExamStudentWidget extends StatelessWidget {
  final ExamModel examModel;
  const ExamStudentWidget({super.key, required this.examModel});

  @override
  Widget build(BuildContext context) {
    final examsStudentProvider = Provider.of<ExamsStudentProvider>(context);
    final String studentDegree = examsStudentProvider.getDegree(examModel.id);
    return InkWell(
        onTap: () => StateExamClick().click(context, examModel, studentDegree != '-1'),
      child: Container(
        padding: const EdgeInsets.all(AppPadding.p12),
        width: double.infinity,
        decoration: BoxDecoration(
          color: white,
          border: Border.all(width: 1, color: greyColor),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[200]!,
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                examModel.name,
                style: getBoldStyle(color: Colors.black, fontSize: FontSize.s20),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Questions: ${examModel.questions.length}',
                style: getRegularStyle(color: greyColor),
              )
            ]),
            if (studentDegree != '-1')
              Row(
                children: [
                  Text(
                    'Your degree: ',
                    style: getRegularStyle(color: Colors.black),
                  ),
                  Text(
                    '$studentDegree / ${examModel.questions.length}',
                    style: getRegularStyle(color: greyColor),
                  )
                ],
              ),
    
            Column(
              children: [
                Icon(
                  Icons.people,
                  size: 20.r,
                ),
                Text(
                  examModel.studentList!.length.toString(),
                  style: getRegularStyle(color: greyColor),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
