import 'package:exams_app_flutter/helpers/assets_manager.dart';
import 'package:exams_app_flutter/main.dart';
import 'package:exams_app_flutter/providers/public_providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkStartUp();
  }

  checkStartUp() async {
    await Future.delayed(const Duration(milliseconds: 500));
    PublicProviders.splashProvider.checkStartUp(Exams.navigatorKey.currentState!.context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              ImageAssets.logo,
              width: 200.w,
            )
          ],
        ),
      )),
    );
  }
}
