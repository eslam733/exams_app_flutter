import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../helpers/assets_manager.dart';
import '../../../../helpers/colors_data.dart';
import '../../../../helpers/font_manager.dart';
import '../../../../helpers/styles_manager.dart';

class WelcomeOption extends StatelessWidget {
  final Function onTap;
  final String title;
  final String icon;
  final Color color;
  final Color background;
  final double iconSize;
  const WelcomeOption(
      {super.key,
      required this.background,
      required this.onTap,
      required this.title,
      required this.iconSize,
      required this.icon,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        padding: const EdgeInsets.all(10),
        width: 150.w,
        decoration: BoxDecoration(
            border: Border.all(width: 2, color: color),
            color: background,
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              icon,
              width: iconSize.w,
              color: color,
            ),
            Text(
              title,
              style: getSemiBoldStyle(color: color, fontSize: FontSize.s20),
            )
          ],
        ),
      ),
    );
  }
}
