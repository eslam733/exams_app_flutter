import 'package:flutter/material.dart';

import '../../../main.dart';

class SocialButton extends StatelessWidget {
  final Color buttonColor;
  final String imagePath;
  final String socialName;
  final Color textColor;
  const SocialButton({
    Key? key,
    required this.buttonColor,
    required this.imagePath,
    required this.socialName,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      width: 350,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(15),
          boxShadow: [
          BoxShadow(
            color: Colors.grey[200]!,
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            width: 30,
            height: 40,
          ),
         const SizedBox(
            width: 10,
          ),
          Text(
            'Sign in with $socialName',
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
