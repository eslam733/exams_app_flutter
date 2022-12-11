import 'package:exams_app_flutter/pages/student/exams_screen/view/widgets/exam_widget.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../../helpers/colors_data.dart';
import '../../../../helpers/font_manager.dart';
import '../../../../helpers/styles_manager.dart';
import '../../../../helpers/values_manager.dart';
import '../../../admin/exams_page/view/widgets/exam_widget.dart';
import '../../../../widgets/loading_widget.dart';
import '../provider/exams_student_helper.dart';
import '../provider/state_exam_click.dart';
import '../provider/state_logout_click.dart';

class ExamsStudentScreen extends StatefulWidget {
  const ExamsStudentScreen({super.key});

  @override
  State<ExamsStudentScreen> createState() => _ExamsStudentScreenState();
}

class _ExamsStudentScreenState extends State<ExamsStudentScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ExamsStudentProvider>(context, listen: false).getExams();
  }

  @override
  Widget build(BuildContext context) {
    final examsStudentProvider = Provider.of<ExamsStudentProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Exams',
          style: getBoldStyle(color: white, fontSize: FontSize.s20),
        ),
        actions: [
          IconButton(
              onPressed: () => StateLogoutClick(context).logout(context),
              icon: const Icon(Icons.logout))
        ],
      ),
      body: ModalProgressHUD(
        inAsyncCall: examsStudentProvider.isLoading,
        progressIndicator: const Center(
          child: LoadingAnimationWidget(),
        ),
        child: examsStudentProvider.exams.isEmpty &&
                !examsStudentProvider.isLoading
            ? Center(
                child: Text(
                  'No Exams',
                  style: getBoldStyle(color: greyColor, fontSize: FontSize.s20),
                ),
              )
            : SingleChildScrollView(
                child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p26),
                child: Column(children: [
                  const SizedBox(
                    height: 20,
                  ),
                  ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => ExamStudentWidget(
                          examModel: examsStudentProvider.exams[index]),
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 20,
                          ),
                      itemCount: examsStudentProvider.exams.length),
                  const SizedBox(
                    height: 20,
                  )
                ]),
              )),
      ),
    );
  }
}
