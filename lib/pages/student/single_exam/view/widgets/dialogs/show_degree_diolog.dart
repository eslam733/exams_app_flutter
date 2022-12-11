import 'package:exams_app_flutter/helpers/font_manager.dart';
import 'package:exams_app_flutter/helpers/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../helpers/colors_data.dart';

class ShowDegreeDialog extends StatelessWidget {
  final String degree;
  final String fullMark;
  const ShowDegreeDialog({Key? key, required this.degree, required this.fullMark, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container( 
        height: 150.h,
        width: MediaQuery.of(context).size.width / 1.5,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Icon(
                Icons.design_services_rounded,
                color: pinkColor,
                size: 70.r,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Your degree: ',
                    style:
                        getBoldStyle(color: lightGreyColor, fontSize: FontSize.s18),
                  ),
                  Text(
                    '$degree / $fullMark',
                    style:
                        getBoldStyle(color: Colors.black, fontSize: FontSize.s18),
                  ),
                ],
              )
            ]),
      ),
    );
  }
}
