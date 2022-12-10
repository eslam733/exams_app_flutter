import 'package:exams_app_flutter/helpers/colors_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


Widget defaultTextField({
  required TextEditingController controller,
  required TextInputType textInputType,
  required String label,
  required Color borderColor,
  required Color iconColor,
  double? width,
  IconData? prefixIcon,
  bool isIPAdress = false,
  bool isPort = false,
  maxLines = 1,
  enabled = true,
  var height,
  required Function validation,
  var onChange,
  var onTap,
  bool wihteSpace = false,
  IconData? suffixIcon,
  String? hintText,
  readOnly = false,
  isPassword = false,
  var suffixIconPressed,
}) =>
    Container(
      height: height,
      width: width,
      alignment: Alignment.center,
      child: TextFormField(
        textAlignVertical: TextAlignVertical.top,
        // inputFormatters: [
        //   if (wihteSpace)
        //     FilteringTextInputFormatter.deny(new RegExp(r"\s\b|\b\s")),
         
        //   if (isPort) LengthLimitingTextInputFormatter(4),
        // ],
        onTap: onTap,
        enabled: enabled,
        maxLines: maxLines,
        readOnly: readOnly,
        onChanged: (String value) {
          if (onChange != null) {
            onChange(value);
          }
        },
        obscureText: isPassword,
        controller: controller,
        validator: (value) {
          return validation(value);
        },
        keyboardType: textInputType,
        decoration: InputDecoration(
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
          ),
          hoverColor: Colors.white,
          labelText: label,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          alignLabelWithHint: true,
          hintText: hintText,
          border: const OutlineInputBorder(borderSide: BorderSide.none, ),
          prefixIcon: prefixIcon != null
              ? Icon(
                  prefixIcon,
                  color: iconColor,
                )
              : null,
          suffixIcon: suffixIcon != null
              ? IconButton(
                  color: iconColor,
                  onPressed: suffixIconPressed,
                  icon: Icon(suffixIcon),
                )
              : null,
        ),
      ),
    );