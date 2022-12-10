import 'package:exams_app_flutter/helpers/colors_data.dart';
import 'package:exams_app_flutter/helpers/font_manager.dart';
import 'package:exams_app_flutter/helpers/styles_manager.dart';
import 'package:exams_app_flutter/helpers/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../../widgets/loading_widget.dart';
import '../provider/exams_helper.dart';
import '../provider/state_add_click.dart';
import '../provider/state_logout_click.dart';
import 'widgets/exam_widget.dart';

class ExamsScreen extends StatefulWidget {
  const ExamsScreen({super.key});

  @override
  State<ExamsScreen> createState() => _ExamsScreenState();
}

class _ExamsScreenState extends State<ExamsScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ExamsProvider>(context, listen: false).getExams();
  }

  @override
  Widget build(BuildContext context) {
    final examsProvider = Provider.of<ExamsProvider>(context);
    return Scaffold(
      floatingActionButton: InkWell(
        onTap: () => StateAddClick().add(context),
        child: Container(
            padding: const EdgeInsets.all(AppPadding.p14),
            decoration: BoxDecoration(color: pinkColor, shape: BoxShape.circle),
            child: Icon(
              Icons.add,
              color: white,
            )),
      ),
      appBar: AppBar(
        title: Text(
          'Exams',
          style: getBoldStyle(color: white, fontSize: FontSize.s20),
        ),
        actions: [IconButton(onPressed: () => StateLogoutClick().logout(context), icon: const Icon(Icons.logout))],
      ),
      body:  ModalProgressHUD(
        inAsyncCall: examsProvider.isLoading,
           progressIndicator: const Center(
        child: LoadingAnimationWidget(),
      ),
        child: examsProvider.exams.isEmpty && !examsProvider.isLoading
                ?  Center(
                    child: Text(
                      'No Exams',
                      style:
                          getBoldStyle(color: greyColor, fontSize: FontSize.s20),
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
                    itemBuilder: (context, index) =>
                        ExamWidget(examModel: examsProvider.exams[index]),
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 20,
                        ),
                    itemCount: examsProvider.exams.length),
                    const SizedBox(
                      height: 20,
                    )
          ]),
        )),
      ),
    );
  }
}
