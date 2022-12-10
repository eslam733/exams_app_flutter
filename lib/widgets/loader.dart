import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class Loaders {
  static EasyLoading easyLoading = EasyLoading();

  static void startLoading(context) {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.spinningCircle
      ..loadingStyle = EasyLoadingStyle.light
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..maskColor = Colors.black.withOpacity(0.5)
      ..userInteractions = false
      ..dismissOnTap = false;
    EasyLoading.show(
        maskType: EasyLoadingMaskType.custom,
        indicator: CircularProgressIndicator(
        ));
  }

  static void endLoading(context) {
    EasyLoading.dismiss();
  }
}
