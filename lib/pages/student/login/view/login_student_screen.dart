import 'package:exams_app_flutter/helpers/assets_manager.dart';
import 'package:exams_app_flutter/helpers/colors_data.dart';
import 'package:exams_app_flutter/helpers/font_manager.dart';
import 'package:exams_app_flutter/helpers/styles_manager.dart';
import 'package:exams_app_flutter/helpers/values_manager.dart';
import 'package:exams_app_flutter/pages/admin/login/provider/login_admin_helper.dart';
import 'package:exams_app_flutter/pages/student/login/provider/state_login_click.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../widgets/social_button.dart';

class LoginStudentScreen extends StatelessWidget {
  const LoginStudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginProvider =
        Provider.of<LoginAdminProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p26),
        child: SizedBox(
            width: double.infinity,
            child: Form(
              key: loginProvider.keyForm,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    ImageAssets.logo,
                    width: 135.w,
                    color: pinkColor,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    'Login as student',
                    style:
                        getBoldStyle(color: pinkColor, fontSize: FontSize.s20),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  InkWell(
                    onTap: () => StateLoginClick(context).login(context),
                    child: const SocialButton(
                      buttonColor: Colors.white,
                      textColor: Colors.black,
                      imagePath: ImageAssets.googleLogo,
                      socialName: 'Google',
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            )),
      )),
    );
  }
}
