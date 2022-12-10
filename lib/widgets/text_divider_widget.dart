import 'package:exams_app_flutter/helpers/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../helpers/colors_data.dart';
import '../helpers/styles_manager.dart';

class TextDividerWidget extends StatelessWidget {
  final String title;
  const TextDividerWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p14),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 1,
              decoration: BoxDecoration(color: pinkDarkColor),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: getRegularStyle(color: pinkColor),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: 1,
              decoration: BoxDecoration(color: pinkDarkColor),
            ),
          ),
        ],
      ),
    );
  }
}
