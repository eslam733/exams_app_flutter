import 'package:exams_app_flutter/helpers/assets_manager.dart';
import 'package:exams_app_flutter/helpers/colors_data.dart';
import 'package:exams_app_flutter/helpers/font_manager.dart';
import 'package:exams_app_flutter/helpers/styles_manager.dart';
import 'package:exams_app_flutter/helpers/validations/validatetors.dart';
import 'package:exams_app_flutter/helpers/values_manager.dart';
import 'package:exams_app_flutter/pages/admin/login/provider/login_admin_helper.dart';
import 'package:exams_app_flutter/pages/admin/login/provider/state_change_password_visibilty.dart';
import 'package:exams_app_flutter/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../widgets/default_text_field.dart';
import '../provider/state_login_click.dart';

class LoginAdminScreen extends StatelessWidget {
  const LoginAdminScreen({super.key});

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
                    'Login as Admin',
                    style: getBoldStyle(color: pinkColor, fontSize: FontSize.s20),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  defaultTextField(
                      borderColor: pinkColor,
                      controller: loginProvider.emailController,
                      iconColor: pinkColor,
                      label: 'email',
                      validation: (val) => validateEmail(value: val, context: context),
                      textInputType: TextInputType.emailAddress,
                      prefixIcon: Icons.email),
                  SizedBox(
                    height: 20.h,
                  ),
                  Selector<LoginAdminProvider, bool>(
                      selector: (_, provider) => provider.isPassword,
                      builder: (context, value, _) {
                        return defaultTextField(
                            borderColor: pinkColor,
                            controller: loginProvider.passwordController,
                            iconColor: pinkColor,
                            label: 'password',
                            validation:  (val) => validateGenerail(value: val, context: context),
                            textInputType: TextInputType.text,
                            prefixIcon: Icons.password,
                            isPassword: loginProvider.isPassword,
                            suffixIcon: !loginProvider.isPassword
                                ? Icons.visibility_off
                                : Icons.visibility_rounded,
                            suffixIconPressed: () =>
                                StateChangePasswordVisibilty(context)
                                    .visibityClick());
                      }),
                  SizedBox(
                    height: 30.h,
                  ),
                  DefaultButton(
                    textColor: white,
                    text: 'Login',
                    function: () => StateLoginClick(context).login(context),
                    color: pinkColor,
                  ), SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            )),
      )),
    );
  }
}
