import 'package:exams_app_flutter/helpers/font_manager.dart';
import 'package:exams_app_flutter/helpers/styles_manager.dart';
import 'package:exams_app_flutter/pages/welcome_page/view/widgets/welcome_option.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../helpers/assets_manager.dart';
import '../../../helpers/colors_data.dart';
import '../provider/state_admin_click.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              height: 10.h,
            ),
            Image.asset(
              ImageAssets.logo,
              width: 250.w,
            ),
            Text(
              'Welcome Back',
              style: getBoldStyle(color: pinkColor, fontSize: FontSize.s20),
            ),
           SizedBox(
              height: 50.h,
            ),
            WelcomeOption(
              onTap: () => StateAdminClick().adminClick(context),
              background: white,
              color: pinkDarkColor,
              icon: ImageAssets.admin,
              title: 'ADMIN',
              iconSize: 32,
            ),
            SizedBox(
              height: 20.h,
            ),
            WelcomeOption(
              onTap: () => StateAdminClick().adminClick(context),
              background: pinkDarkColor,
              color: white,
              icon: ImageAssets.student,
              title: 'STUDENT', 
              iconSize: 30,
            ),
            SizedBox(
              height: 70.h,
            )
          ]),
        ),
      ),
    );
  }
}
